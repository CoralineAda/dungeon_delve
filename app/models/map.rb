class Map < ActiveRecord::Base

  belongs_to :current_room, class_name: "Room"

  def self.current
    Map.first || reset
  end

  def self.ensure_room_at(*coords)
    Room.find_or_create_by(coords: coords)
  end

  def self.reset
    Map.destroy_all
    Room.destroy_all
    Map.create(current_room_id: ensure_room_at(0,0).id)
  end

  def set_current_room(room)
    current.update_attributes current_room_id: room.id
  end

end
