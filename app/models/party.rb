class Party < ApplicationRecord

  has_many :players

  MAX_PARTY_SIZE = 5

  def self.current
    Party.first || Party.create
  end

  def self.add_player(player)
    return "Sorry! The party is full, but I will notify you when it's your turn." if current.players.count == MAX_PARTY_SIZE
    current.players << player
    player.update_attributes(queued_at: nil)
    "You have joined the party with #{current.party_members}. Good luck!"
  end

  def self.remove_player(player)
    player.party = nil
    player.save
    Client.notify(Player.in_queue)
  end

  def self.show_party
    "Current party: #{current.party_members}"
  end

  private

  def party_members
    self.players && self.players.map(&:handle).to_sentence
  end

end
