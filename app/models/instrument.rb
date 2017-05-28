class Instrument < ActiveRecord::Base

  belongs_to :player
  belongs_to :room

  before_create :describe
  validates_uniqueness_of :name

  private

  def describe
    self.name = "#{Randomizer.adjective} #{Randomizer.material} #{Randomizer.musical_instrument}"
  end

end
