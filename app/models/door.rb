class Door < ActiveRecord::Base

  def opens_into?(coords)
    self.from_coords == coords || self.to_coords == coords
  end

end
