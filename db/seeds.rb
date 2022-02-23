# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "clean db"

Wagon.destroy_all

puts "Initializing FAKER..."

@user = User.new(email: Faker::Internet.email, first_name: 'user', last_name: 'test', password: 'testtest')
@user.save!

10.times do
  wagon = Wagon.new(
    name: Faker::Beer.brand,
    description: Faker::Quotes::Shakespeare.hamlet_quote,
    capacity: 8,
    available_dates: ["20/06/2022", "03/04/2023"],
    location: ["Paris", "Lyon", "Marseille", "Rennes", "Strasbourg", "Biarritz", "Toulouse"].sample
  )
  wagon.user = @user
  wagon.save!
end

puts 'All done'
