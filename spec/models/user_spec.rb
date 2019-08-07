require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a name' do
    should validate_presence_of(:name)
  end

  it 'has an email' do
    should validate_presence_of(:email)
  end

  it 'has many orders' do
    should have_many(:orders).dependent(:destroy)
  end

  it 'has many reviews' do
    should have_many(:reviews).dependent(:destroy)
  end

  it 'has many comments' do
    should have_many(:comments).dependent(:destroy)
  end
end
