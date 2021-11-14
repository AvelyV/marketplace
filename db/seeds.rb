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
    Meet my new favorite pancake recipe. It’s easy, healthy and vegan, to boot!", price: 10, qty: 4, user_id: 1, location_id: 1)
Listing.create!(title: "Buddha Bowl", description: "Super yummi food that is raw and will fill you up for 3 days. highly reccomend, my absolute favorite, now my family eats olny 3 meals per week, real money saver", price: 12.50, qty: 2, user_id: 2, location_id: 2)
Listing.create!(title: "Chili", description: "It’s freezing cold outside, and has been for days. All I want to eat is cozy comfort food like this vegetarian chili recipe. It’s my favorite, and leftovers taste even better the next day.
    This chili is perfect for watching football games with a crowd, since it’s a hearty meatless option that carnivores will enjoy. Plus, it can be vegan and gluten free if you choose your toppings carefully. This chili will satisfy everyone.", price: 9, qty: 10, user_id: 2, location_id: 2)
Listing.create!(title: "Citrus salad", description: "Every few days or so, our next-door neighbor here in Santa Barbara leaves us the most beautiful citrus fruit by our front door. It grows from an older tree in his yard that was graphed with several different types of varieties of oranges and mandarins all coming out of the same stock. Anyways, the fruit is amazing and this is what inspired this Citrus Salad.
    Not only does this salad provide a huge burst of immune-boosting vitamin C, but it’s also such a joyful happy salad to make. Seriously, the smell alone will cheer ya up", price: 10.50, qty: 2, user_id: 1, location_id: 1)

puts "#{User.count}/2 users were created"
puts "#{Category.count}/9 categories were created"
puts "#{Location.count}/2 locations were created"
puts "#{Listing.count}/4 listings were created"
