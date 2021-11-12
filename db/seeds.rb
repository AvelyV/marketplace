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

Location.create!(state: "QLD", suburb: "Brisbane", postcode: "4000")
Location.create!(state: "NSW", suburb: "Yamba", postcode: "2464")

Listing.create!(title: "Fluffy Pancakes", description: "It’s been lovely. My pancake endeavors have paid off, too. 
    I realized the other day that I don’t have a basic pancake recipe on the blog, so here we are. 
    Meet my new favorite pancake recipe. It’s easy, healthy and vegan, to boot!", price: 1000, qty: 4, user_id: 1, location_id: 1)
Listing.create!(title: "Buddha Bowl", description: "Super yummi food that is raw and will fill you up for 3 days. highly reccomend, my absolute favorite, now my family eats olny 3 meals per week, real money saver", price: 1200, qty: 2, user_id: 2, location_id: 2)

puts "#{User.count}/2 users were created"
puts "#{Category.count}/9 categories were created"
puts "#{Location.count}/2 locations were created"
puts "#{Listing.count}/2 listings were created"
