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
    p raw_message
    chunks = raw_message.split
    if player
      handle_length = player.handle.length + 2
      handle_chunk = "@#{player.handle}"
    else
      handle_length = 0
      handle_chunk = ""
    end
    if chunks.join(' ').length + handle_length > 140
      chunks.each do |chunk|
        word = chunks.shift
        if handle_length + chunked.last.to_s.length + word.length + 1 < 140
          last_chunk = chunked.pop
          chunked << [handle_chunk, last_chunk, word].compact.join(' ').squish
        else
          chunked << chunk_message(chunks.join(' ').squish, player, chunked)
        end
      end
    else
      chunked << [handle_chunk, chunks].join(' ').squish
      chunks = []
    end
    chunked << chunk_message(chunks.join(' '), player, chunked) if chunks.any?
    chunked.flatten
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
