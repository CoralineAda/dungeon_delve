class Commander

  PROCESSOR_CLASSES = %w{Room}

  def self.process(command_string)
    return unless command_string.present?
    verb = command_string.split[0]
    if predicate = command_string.split[1..-1]
      predicate = predicate.join(' ')
    else
      predicate ||= verb
    end
    if command = Command.where("synonyms ~* ?", verb).first
      klass = eval(command.handler_class)
      if command.takes_arguments? && predicate
        klass.public_send(command.handler_method, predicate)
      else
        klass.public_send(command.handler_method)
      end
    end
  end

end
