class Player < ActiveRecord::Base

  validates_presence_of :name, :handle, :twitter_id
  validates_uniqueness_of :twitter_id

  has_many :generic_items
  has_many :weapons
  has_many :light_sources
  has_many :readables
  has_many :wearables

end
