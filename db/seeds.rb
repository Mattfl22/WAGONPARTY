# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Cleaning db..."

Wagon.destroy_all

puts "Initializing FAKER..."

@user = User.create(first_name: "Vincent", last_name: "Orinel", email: 'test@gmail.com', password: 'azerty')

10.times do
  wagon = Wagon.new(
    name: Faker::Beer.brand,
    description: Faker::Quote.yoda,
    capacity: [100, 150, 200, 50].sample,
    dates: ["03/04/2023", "22/04/2022"],
    location: ["Paris", "Lyon", "Marseille", "Rennes", "Strasbourg", "Biarritz", "Toulouse"].sample
  )
  wagon.user = @user
  wagon.save!
end

puts 'All done'
