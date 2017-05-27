class Namer

  ADJECTIVES = [
    "bejeweled",
    "black",
    "brightly painted",
    "corroded",
    "dull",
    "engraved",
    "filigreed",
    "flaming",
    "flexible",
    "glowing",
    "heavy",
    "imposing",
    "jewel-encrusted",
    "light-weight",
    "matte black",
    "medium-sized",
    "rainbow",
    "rigid",
    "rusty",
    "shining",
    "shiny",
    "slender",
    "slippery",
    "sticky",
    "translucent",
    "weathered",
    "wide"
  ]

  CONTAINERS = [
    "ark",
    "backpack",
    "bag of holding",
    "box",
    "chest",
    "portable hole",
    "pouch",
    "sack"
  ]

  GENERIC_ITEMS = [
    "rope",
    "10' pole",
    "lantern",
    "orb",
    "coin",
    "letter opener",
    "envelope",
    "lock pick",
    "paperclip"
  ]

  GENERIC_MATERIALS = [
    "carbon fiber",
    "cardboard",
    "clay",
    "crystal",
    "glass",
    "golden",
    "hempen",
    "iron",
    "paper",
    "plastic",
    "porcelain",
    "rubber",
    "silk",
    "silver",
    "steel",
    "titanium",
    "wooden"
  ]

  LIGHT_SOURCES = [
    "glowing orb",
    "lantern",
    "torch",
    "box of wooden matches"
  ]

  MUSICAL_INSTRUMENTS = [
    "drum",
    "flute",
    "guitar",
    "horn",
    "penny whistle",
    "lute",
    "saxophone",
    "trumpet"
  ]

  READABLE_ITEMS = [
    "book",
    "flyer",
    "letter",
    "pamphlet",
    "scroll",
    "tome"
  ]

  WEAPONS = [
    "axe",
    "blowgun",
    "bola",
    "boomerang",
    "bow",
    "club",
    "crossbow",
    "cutlass",
    "dagger",
    "flail",
    "great sword",
    "grenade",
    "hatchet",
    "longsword",
    "mace",
    "pole axe",
    "quarterstaff",
    "rapier",
    "sabre",
    "scythe",
    "spear",
    "staff",
    "sword",
    "throwing star",
    "wand",
    "war hammer",
    "whip"
  ]

  WEAPON_MATERIALS = [
    "bronze",
    "copper",
    "gold",
    "iron",
    "onyx",
    "ruby",
    "silver",
    "steel",
    "stone",
    "wooden",
  ]

  WEARABLE_ITEMS = [
    "amulet",
    "armor",
    "cape",
    "cloak",
    "jerkin",
    "ring"
  ]

  def self.weapon_name
    "#{ADJECTIVES.sample} #{WEAPON_MATERIALS.sample} #{WEAPONS.sample}"
  end

  def self.instrument_name
    "#{ADJECTIVES.sample} #{GENERIC_MATERIALS.sample} #{MUSICAL_INSTRUMENTS.sample}"
  end

  def self.container_name
    "#{ADJECTIVES.sample} #{GENERIC_MATERIALS.sample} #{CONTAINERS.sample}"
  end

  def self.light_source_name
    "#{GENERIC_MATERIALS.sample} #{LIGHT_SOURCES.sample}"
  end

  def self.readable_name
    "#{ADJECTIVES.sample} #{READABLE_ITEMS.sample}"
  end

  def self.wearable_name
    "#{GENERIC_MATERIALS.sample} #{WEARABLE_ITEMS.sample}"
  end

  def self.generic_name
    "#{ADJECTIVES.sample} #{GENERIC_MATERIALS.sample} #{GENERIC_ITEMS.sample}"
  end

end
