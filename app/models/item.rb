 class Item

  def self.at(room_id)
    Weapon.where(room_id: room_id) +
    GenericItem.where(room_id: room_id) +
    Instrument.where(room_id: room_id) +
    LightSource.where(room_id: room_id) +
    Readable.where(room_id: room_id) +
    Weapon.where(room_id: room_id) +
    Wearable.where(room_id: room_id)
  end

  def self.create_at(room_id)
    item = case rand(10)
      when 0; create_weapon
      when 1; create_instrument
      when 2; create_light_source
      when 3; create_readable
      when 4; create_wearable
      else; create_generic
      end
    item.room_id = room_id
    item.save
  end

  def self.create_weapon
    Weapon.create(
      is_magical: rand(5) == 1
    )
  end

  def self.create_instrument
    Instrument.create(
      is_magical: rand(5) == 1
    )
  end

  def self.create_light_source
    LightSource.create(room_id: room_id)
  end

  def self.create_readable
    Readable.create
  end

  def self.create_wearable
    Wearable.create(
      is_magical: rand(5) == 1
    )
  end

  def self.create_generic
    GenericItem.create
  end

  def self.take(item_name)
    if item = Map.current.current_room.items.find{ |item| item.name =~ /#{item_name}/i }
      "You grab the #{item.name}."
    else
      "I don't see that here!"
    end
  end

  def give_to(item, user)
    item.user = user
    item.save
  end

  def drop(item)
    item.user = nil
    item.room_id = Map.current.current_room_id
    item.save
  end

end
