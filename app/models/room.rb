class Room < ActiveRecord::Base
  serialize :coords, JSON
  after_create :make_doors
  has_one :map

  DIRECTIONS = %w{north south east west}
  OFFSET_FOR_DIRECTION = {
    north: [  0,  1 ],
    south: [  0, -1 ],
    east:  [  1,  0 ],
    west:  [ -1,  0 ],
  }

  def doors
    Door.where("from_coords = :target OR to_coords = :target", { target: self.coords.to_json })
  end

  def exit_to(direction)
    coords = coords_in_direction(direction)
    return unless doors.find{ |door| door.opens_into?(coords)}
    new_room = self.class.ensure_room_at(coords)
    map.set_current_room self
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
      Door.create(
        from_coords: self.coords,
        to_coords: coords_in_direction(direction)
      )
    end
  end

end
