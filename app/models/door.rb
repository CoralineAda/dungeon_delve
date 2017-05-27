class Door < ActiveRecord::Base

  serialize :from_coords, JSON
  serialize :to_coords, JSON

  def self.exists_between?(start_coords, end_coords)
    sql = <<~SQL
      (from_coords = :start_coords AND to_coords = :end_coords)
      OR
      (from_coords = :end_coords AND to_coords = :start_coords)
    SQL
    where(
      sql,
      {
        start_coords: start_coords.to_json,
        end_coords: end_coords.to_json
      }
    ).first.present?
  end

  def opens_into?(coords)
    self.from_coords == coords || self.to_coords == coords
  end

end
