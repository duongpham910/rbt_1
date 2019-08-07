require 'rails_helper'

RSpec.describe Room, type: :model do
  it 'have many seats' do
    should have_many(:seats).dependent(:destroy)
  end

  it 'have many movie_theater' do
    should have_many(:movie_theaters).dependent(:destroy)
  end

  it 'belong to theater' do
    should belong_to(:theater)
  end

  it 'has a name unique' do
    should validate_uniqueness_of(:name)
    should validate_presence_of(:name)
  end

end
