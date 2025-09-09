# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

20.times do
  User.create!(name: Faker::Name.name, email: Faker::Internet.unique.email, password: "password", password_confirmation: "password")
end

user_ids = User.ids

5.times do
  user = User.find(user_ids.sample)
  user.kids.create!(name: Faker::Name.name, gender: 0, color: 0)
end
