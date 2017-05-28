class Player < ActiveRecord::Base

  validates_presence_of :name, :handle, :twitter_id
  validates_uniqueness_of :twitter_id

  belongs_to :party
  has_many :generic_items
  has_many :weapons
  has_many :light_sources
  has_many :readables
  has_many :wearables

  def self.random_player_name
    return "no one" unless Player.count > 0
    Player.all.sample.handle
  end

end
