require 'rails_helper'

RSpec.describe Map, type: :model do
  let(:map) { Map.current }

  specify "there is always a map" do
    expect( map ).to be_present
  end

  describe "origin room" do

    specify "exists" do
      expect(map.current_room).to be_present
      expect(map.current_room.coords).to eq( [0,0] )
    end

    specify "has four doors" do
      expect(map.current_room.doors.count).to eq(4)
    end

  end

end
