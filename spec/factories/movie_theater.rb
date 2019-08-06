require 'faker'

FactoryBot.define do

  factory :city do
    name {Faker::Name.unique.name}
  end

  factory :theater do
    city
    name {Faker::Name.unique.name}
  end
  
  factory :category do
    name {Faker::Name.unique.name}
  end

  factory :movie do
    category
    name {Faker::Name.unique.name}
    trailer {"https://www.youtube.com/watch?v=mLB_Gn3SkNk"}
  end

  factory :room do
    theater
    name {Faker::Name.unique.name}
  end

  factory :movie_theater do
    theater
    movie
    room
    time {Time.now}
  end
end
