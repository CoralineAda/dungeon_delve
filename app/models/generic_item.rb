class GenericItem < ActiveRecord::Base

  before_create :describe
  validates_uniqueness_of :name

  belongs_to :room
  belongs_to :player

  private

  def describe
    self.name = "#{Randomizer.adjective} #{Randomizer.generic_item}"
  end

end
