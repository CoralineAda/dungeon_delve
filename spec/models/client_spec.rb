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
      expect(client.chunk_message(message, player).join(' ')).to eq("@#{player.handle} #{message}")
    end

    it "truncates a long message without a handle" do
      message = "Donec ullamcorper nulla non metus auctor fringilla. Donec ullamcorper nulla non metus auctor fringilla. Curabitur blandit tempus porttitor. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus."
      chunked = client.chunk_message(message)
      expect(chunked[0]).to eq("Donec ullamcorper nulla non metus auctor fringilla. Donec ullamcorper nulla non metus auctor fringilla. Curabitur blandit tempus porttitor.")
      expect(chunked[1]).to eq("Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.")
    end

    it "truncates a long message with a handle" do
      message = "Donec ullamcorper nulla non metus auctor fringilla. Donec ullamcorper nulla non metus auctor fringilla. Curabitur blandit tempus porttitor. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus."
      chunked = client.chunk_message(message, player)
      p chunked
      expect(chunked[0]).to eq("@CoralineAda Donec ullamcorper nulla non metus auctor fringilla. Donec ullamcorper nulla non metus auctor fringilla. Curabitur blandit")
      expect(chunked[1]).to eq("@CoralineAda tempus porttitor Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit")
      expect(chunked[2]).to eq("@CoralineAda amet risus.")
    end


  end
end
