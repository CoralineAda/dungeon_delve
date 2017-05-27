class Room < ActiveRecord::Base

  after_create :make_doors
  after_initialize :set_coords

  scope :current, -> { is_current: true }

  DIRECTIONS = %w{north south east west}
  OFFSET_FOR_DIRECTION = {
    north: [  0,  1 ],
    south: [  0, -1 ],
    east:  [  1,  0 ],
    west:  [ -1,  0 ],
  }

  def doors
    Door.where("from_coords = :target OR to_coords = :target", { target: self.coords })
  end

  def exit_to(direction)
    coords = coords_in_direction(direction)
    return unless doors.find{ |door| door.opens_into?(coords)}
    new_room = self.class.ensure_room_at(coords)
    self.update_attribute(:current, false)
    new_room.update_attribute(:current, true)
  end

  private

  def coords_in_direction(direction)
    offset = OFFSET_FOR_DIRECTION[direction.to_sym]
    self.coords.zip(offset).map {|a, b| a + b }
  end

  def first_room?
    self.class.current.empty?
  end

  def make_doors
    DIRECTIONS.each do |direction|
      next unless rand(2) == 1
      Door.create(
        from_coords: self.coords,
        to_coords: coords_in_direction(direction)
      )
    end
    make_doors if doors.count == 0
  end

  def set_coords
    if first_room?
      self.coords = [ 0, 0 ]
    else
    end

  end

end
