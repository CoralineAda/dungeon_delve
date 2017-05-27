class Map < ActiveRecord::Base

  def self.current
    Map.first
  end

  def self.reset
    Map.destroy_all
    Map.create(current_room_id: ensure_room_at(0,0).id)
  end

  def self.ensure_room_at(*coords)
    Room.find_or_create_by(coords: coords)
  end

end
