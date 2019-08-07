require 'rails_helper'

RSpec.describe MovieTheater, type: :model do
  
  before(:all) do
    @city = create(:city)
    @theater = create(:theater)
    @theater2 = create(:theater, name: Faker::Name.unique.name)
    @category = create(:category)
    @movie = create(:movie)
    @room = create(:room)
  end

  it 'validate a room' do
    @movie_theater = build(:movie_theater, theater_id: @theater2.id, room_id: @room.id)
    @movie_theater.valid?
    expect(@movie_theater.errors[:theater]).to include("Room not belong to theater")
  end
end
