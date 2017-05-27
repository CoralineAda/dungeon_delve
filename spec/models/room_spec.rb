require 'rails_helper'

RSpec.describe Room, type: :model do

  let!(:origin_room) { Room.create(coords: [0,0]) }

  context "#make_doors" do

    it "generates at least one door" do
      Map.reset
      new_room = origin_room.exit_to("east")
      expect( new_room.doors ).to_not be_empty
    end

    it "generates four doors for the origin room" do
      expect( origin_room.doors.count ).to eq(4)
    end
  end

  context "#exit_to" do

    it "places you in another room" do
      Map.reset
      new_room = origin_room.exit_to("east")
      expect( Map.current.current_room ).to be_present
      expect( Map.current.current_room ).to_not eq(origin_room)
      expect( Map.current.current_room ).to eq(new_room)
      expect( new_room.coords ).to eq( [1,0] )
    end

  end

end
