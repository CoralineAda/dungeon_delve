class Readable < ApplicationRecord
  belongs_to :player
  belongs_to :room

  before_create :describe
  validates_uniqueness_of :name

  private

  def describe
    self.name = "#{Randomizer.adjective} #{Randomizer.reading_material}"
    self.text = generated_text
  end

  private

  def dictionary
    dictionary ||= MarkyMarkov::TemporaryDictionary.new
    dictionary.parse_file('./db/corpus.txt')
    dictionary
  end

  def generated_text
    dictionary.generate_1_sentence
  end

end
