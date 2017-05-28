#TODO look at items and other players
class Looker

  def self.look(at)
    return Map.current.current_room.describe if at.nil?
  end

end
