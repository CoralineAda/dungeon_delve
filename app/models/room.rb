class Room < ApplicationRecord
  serialize :coords, JSON

  after_create :make_doors
  before_create :make_dark_or_light
  before_create :create_description
  after_create :place_item

  validates_presence_of :coords

  DIRECTIONS = %w{north south east west}
  OFFSET_FOR_DIRECTION = {
    north: [  0,  1 ],
    south: [  0, -1 ],
    east:  [  1,  0 ],
    west:  [ -1,  0 ],
  }

  def self.describe
    Map.current.current_room.describe
  end

  def self.ensure_room_at(coords)
    Room.find_or_create_by(coords: coords)
  end

  def self.move_to(direction)
    if Map.current.current_room.exit_to(direction)
      Map.current.current_room.describe
    else
      "You can't go that way!"
    end
  end

  def describe
    if is_dark?
      "It's dark in here... there might be a Grue nearby!\nContents: #{contents}\nExits: #{exits}"
    else
      "#{description}\nContents: #{contents}\nExits: #{exits.join(', ')}"
    end
  end

  def exit_to(direction)
    new_coords = coords_in_direction(direction)
    return unless doors.find{ |door| door.opens_into?(new_coords)}
    new_room = self.class.ensure_room_at(new_coords)
    map.current_room = new_room
    map.save
    new_room
  end

  def items
    Item.at(self.id)
  end

  def look_to(direction)
    new_coords = coords_in_direction(direction)
    return unless doors.find{ |door| door.opens_into?(new_coords)}
    new_room = self.class.ensure_room_at(new_coords)
    new_room.description
  end

  private

  def contents
    return "Nothing" unless Item.at(self.id).any?
    Item.at(self.id).map(&:name).to_sentence
  end

  def coords_in_direction(direction)
    offset = OFFSET_FOR_DIRECTION[direction.to_sym]
    self.coords.zip(offset).map {|a, b| a + b }
  end

  def create_description
    self.description = [
      Randomizer.room_adjective.capitalize,
      Randomizer.room_type,
      Randomizer.room_description
    ].join(' ') + "."
  end

  def doors
    Door.where("from_coords = :target OR to_coords = :target", { target: self.coords.to_json })
  end

  def exits
    x = self.coords[0]
    y = self.coords[1]
    OFFSET_FOR_DIRECTION.map do |direction, ordinal_coords|
      if Door.where(
          to_coords: [x + ordinal_coords[0], y + ordinal_coords[1]],
          from_coords: self.coords
        ).first
        direction.to_s
      elsif Door.where(
          to_coords: self.coords,
          from_coords: [x + ordinal_coords[0], y + ordinal_coords[1]]
        ).first
        direction.to_s
      end
    end.compact.uniq
  end

  def has_grue?
    return false unless self.is_dark?
    Randomizer.one_chance_in(5)
  end

  def make_dark_or_light
    self.is_dark = rand(10) == 1
  end

  def make_doors
    DIRECTIONS.each do |direction|
      next unless Randomizer.one_chance_in(2) || self.coords == [0,0]
      new_coords = coords_in_direction(direction)
      next if Door.exists_between?(self.coords, new_coords)
      Door.find_or_create_by(
        from_coords: self.coords,
        to_coords: new_coords
      )
    end
  end

  def map
    @_map ||= Map.current
  end

  def place_item
    Item.create_at(self.id) if Randomizer.one_chance_in(5)
  end

end
