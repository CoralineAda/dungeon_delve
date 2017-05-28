class Room < ActiveRecord::Base
  serialize :coords, JSON

  after_create :make_doors
  before_create :make_dark_or_light
  before_create :describe
  after_create :place_item

  validates_presence_of :coords

  DIRECTIONS = %w{north south east west}
  OFFSET_FOR_DIRECTION = {
    north: [  0,  1 ],
    south: [  0, -1 ],
    east:  [  1,  0 ],
    west:  [ -1,  0 ],
  }

  def self.ensure_room_at(coords)
    Room.find_or_create_by(coords: coords)
  end

  def doors
    Door.where("from_coords = :target OR to_coords = :target", { target: self.coords.to_json })
  end

  def exit_to(direction)
    new_coords = coords_in_direction(direction)
    return unless doors.find{ |door| door.opens_into?(new_coords)}
    new_room = self.class.ensure_room_at(new_coords)
    map.current_room = new_room
    map.save
    new_room
  end

  def has_grue?
    return false unless self.is_dark?
    Randomizer.one_chance_in(5)
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

  def map
    @_map ||= Map.current
  end

  private

  def coords_in_direction(direction)
    offset = OFFSET_FOR_DIRECTION[direction.to_sym]
    self.coords.zip(offset).map {|a, b| a + b }
  end

  def describe
    self.description = [
      Randomizer.room_adjective,
      Randomizer.room_type,
      Randomizer.room_description
    ].join(' ') + "."
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

  def place_item
    Item.create_at(self.id) if Randomizer.one_chance_in(5)
  end

end
