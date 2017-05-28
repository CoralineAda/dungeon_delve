class Map < ApplicationRecord

  belongs_to :current_room, class_name: "Room", foreign_key: :current_room_id

  def self.current
    Map.first || reset
  end

  def self.ensure_room_at(*coords)
    Room.find_or_create_by(coords: coords)
  end

  def self.reset
    Map.destroy_all
    Room.destroy_all
    Party.destroy_all
    Map.create(current_room_id: ensure_room_at(0,0).id)
    Party.create
  end

end
