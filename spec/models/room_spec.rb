require 'rails_helper'

RSpec.describe Room, type: :model do

  context "#make_doors" do

    it "generates at least one door" do
      room = Room.create
      expect( room.doors ).to_not be_empty
    end

  end

end
