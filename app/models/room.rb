class Room < ActiveRecord::Base
  serialize :coords, JSON
  after_create :make_doors
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

  def map
    @_map ||= Map.current
  end

  private

  def coords_in_direction(direction)
    offset = OFFSET_FOR_DIRECTION[direction.to_sym]
    self.coords.zip(offset).map {|a, b| a + b }
  end

  def make_doors
    DIRECTIONS.each do |direction|
      next unless rand(2) == 1 || self.coords == [0,0]
      new_coords = coords_in_direction(direction)
      next if Door.exists_between?(self.coords, new_coords)
      Door.find_or_create_by(
        from_coords: self.coords,
        to_coords: new_coords
      )
    end
  end

end
