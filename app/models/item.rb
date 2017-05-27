 class Item < ActiveRecord::Base

  scope :unplaced, -> { where(place_id: nil) }

  belongs_to :user

  validates_uniqueness_of :name

  def self.create_item
    case rand(10)
    when 0; create_weapon
    when 1; create_instrument
    when 2; create_container
    when 3; create_light_source
    when 4; create_readable
    when 5; create_wearable
    else; create_generic
  end

  def self.create_weapon
    Item.create(
      name: ::Namer.weapon_name,
      is_weapon: true,
      is_magical: rand(5) == 1
    )
  end

  def self.create_instrument
    Item.create(
      name: ::Namer.instrument_name,
      is_musical: true,
      is_magical: rand(5) == 1
    )
  end

  def self.create_container
    Item.create(
      name: ::Namer.container_name,
      is_container: true
    )
  end

  def self.create_light_source
    Item.create(
      name: ::Namer.light_source_name,
      is_light_source: true
    )
  end

  def self.create_readable
    Item.create(
      name: ::Namer.readable_name,
      is_readable: true
    )
  end

  def self.create_wearable
    Item.create(
      name: ::Namer.wearable_name,
      is_wearable: true,
      is_magical: rand(5) == 1
    )
  end

  def self.create_generic
  end

  def give_to(user)
    self.user = user
  end

  def drop
    self.user = nil
  end

end
