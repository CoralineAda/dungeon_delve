class Door < ActiveRecord::Base

  serialize :from_coords, JSON
  serialize :to_coords, JSON

  def opens_into?(coords)
    self.from_coords == coords || self.to_coords == coords
  end

end
