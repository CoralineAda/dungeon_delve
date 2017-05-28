class Client

  def self.notify(message, *player)
    player[0..4].each{ |player| new.notify(message, player)}
  end

  def reply(raw_message, player)
    if message.length > 140
      client.update(message.truncate(140))
    end
  end

  def chunk_message(raw_message, player=nil, chunked=[])
    return chunked unless raw_message.present?
    chunks = raw_message.split
    if player
      handle_length = player.handle.length + 2
      handle_chunk = "@#{player.handle}"
    else
      handle_length = 0
      handle_chunk = ""
    end
    proposed_chunk = [handle_chunk, chunked.last, chunks[0]].compact.join(' ')
    if proposed_chunk.length <= 140
      chunked << [chunked.pop, chunks.shift].compact.join(' ')
    else
      chunked << chunks.shift
    end
    chunk_message(chunks.join(' '), player, chunked)
    chunked.map do |chunk|
      if handle_chunk.present?
        "#{handle_chunk} #{chunk}"
      else
        chunk
      end
    end.flatten
  end

  private

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_SECRET"]
    end
  end

end
