require 'rails_helper'

RSpec.describe Client, type: :model do

  let(:client) { Client.new }
  let(:player) { Player.new(handle: "CoralineAda") }

  context "#chunk_message" do

    it "preserves a message of 140 characters without a handle" do
      message = "Justo Ligula Ipsum Nullam Tellus"
      expect(client.chunk_message(message).join(' ')).to eq(message)
    end

    it "preserves a message of 140 characters with a handle" do
      message = "Justo Ligula Ipsum Nullam Tellus"
      expect(client.chunk_message(message, player.handle).join(' ')).to eq("@#{player.handle} #{message}")
    end

    it "truncates a long message without a handle" do
      message = "Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Morbi leo risus, porta ac consectetur ac, vestibulum at eros."
      chunked = client.chunk_message(message)
      expect(chunked[0]).to eq("Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Morbi leo risus, porta ac")
      expect(chunked[1]).to eq("consectetur ac, vestibulum at eros.")
    end

    it "truncates a long message with a handle" do
      message = "Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Morbi leo risus, porta ac consectetur ac, vestibulum at eros."
      chunked = client.chunk_message(message, player.handle)
      expect(chunked[0]).to eq("@CoralineAda Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Morbi leo")
      expect(chunked[1]).to eq("@CoralineAda risus, porta ac consectetur ac, vestibulum at eros.")
    end


  end
end
