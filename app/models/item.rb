 class Item

  def self.create_at
    item = case rand(10)
      when 0; create_weapon
      when 1; create_instrument
      when 2; create_container
      when 3; create_light_source
      when 4; create_readable
      when 5; create_wearable
      else; create_generic
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
