# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: "test@test.com", password: "password")
User.create!(email: "a@b.com", password: "password")

Category.create!(name: "WFBP")
Category.create!(name: "Gluten free")
Category.create!(name: "Raw")
Category.create!(name: "Sweet")
Category.create!(name: "Frozen")
Category.create!(name: "Fresh")
Category.create!(name: "Savory")
Category.create!(name: "Soup")
Category.create!(name: "Pasta")

a = Location.create!(state: "QLD", suburb: "Brisbane City", postcode: "4000")

Listing.create!(title: "Pancakes", )


puts "#{User.count}/2 users were created"
puts "#{Category.count}/9 categories were created"
puts "#{Location.count}/x locations were created"
puts "#{Listing.count}/x listings were created"
