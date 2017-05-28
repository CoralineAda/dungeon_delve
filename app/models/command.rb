class Command < ApplicationRecord

  def self.process(command_string, player)
    return unless command_string.present?
    return not_playing unless Party.current.players.include?(player)
    verb = command_string.split[0]
    predicate = command_string.split[1..-1]
    if predicate.any?
      predicate = predicate.join(' ')
    else
      predicate = verb
    end
    message = ""
    if command = where("synonyms ~* ?", verb).first
      klass = eval(command.handler_class)
      if command.takes_arguments? && predicate
        message = klass.public_send(command.handler_method, predicate)
      else
        message = klass.public_send(command.handler_method)
      end
      message = "@#{player.handle} #{message}" if command.send_reply?
    end
    #Client.send_message(message)
  end

  def not_playing
    "Sorry, but you're not currently in the party. Try 'join party' to enter the dungeon."
  end

end
