# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

10.times do |ind|
  users = User.create!(first_name: Faker::Overwatch.hero, last_name: Faker::Name.middle_name, description: Faker::BackToTheFuture.quote, email: Faker::Internet.email, password: Faker::Overwatch.hero)
end

10.times do |ind|
  gossips = Gossip.create!(content: Faker::Lovecraft.sentence, user_id: Faker::Number.between(1, 10))
end

50.times do |ind|
  likes = Like.create!(user_id: Faker::Number.between(1, 10), gossip_id: Faker::Number.between(1, 10))
end


100.times do |ind|
  registrations = Registration.create!(email: Faker::Internet.email, password: Faker::Overwatch.hero)
end

