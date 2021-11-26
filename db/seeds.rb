# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Category.destroy_all
Location.destroy_all
Listing.destroy_all
Conversation.destroy_all
Rating.destroy_all

a = User.create!(email: "test@test.com", password: "password",
             about_me: "I like to cook and share it with the world. All my meals are vegan and super convenient", username: "MollyHolly")
b = User.create!(email: "a@b.com", password: "password",
             about_me: "I'm just here to get access to yummy meals. I mostly like comfort food", username: "Foodie765")
third = User.create!(email: "sam@test.com", password: "password",
                     about_me: "I love to cook! I am also available for catering if you are interested, get in contact!", username: "Samantha")

Rating.create!(rating_giver_id: a.id, rating_receiver_id: b.id, rating: 8, comment: "Very easy to deal with, no problems.")
Rating.create!(rating_giver_id: b.id, rating_receiver_id: a.id, rating: 10, comment: "Have bought many meals from #{a.username}, couldn't be happier. Great value!")

a.add_role :admin

w = Category.create!(name: "WFBP")
g = Category.create!(name: "Gluten free")
r = Category.create!(name: "Raw")
s = Category.create!(name: "Sweet")
y = Category.create!(name: "Savory")
o = Category.create!(name: "Soup")
t = Category.create!(name: "Pasta")
f = Category.create!(name: "Frozen")
h = Category.create!(name: "Fresh")
kf = Category.create!(name: "Breakfast")
snack = Category.create!(name: "Snack")
l = Category.create!(name: "Salad")
m = Category.create!(name: "Comfort")


c = Location.create!(state: "QLD", suburb: "Brisbane", postcode: "4000")
d = Location.create!(state: "NSW", suburb: "Yamba", postcode: "2464")

Listing.create!(picture: { io: File.open(Rails.root.join('app/assets/images/pancakes.jpg')), filename: 'pancakes.jpg' }, 
                      title: "Fluffy Pancakes", 
                      description: "It’s been lovely. My pancake endeavors have paid off, too.I realized the other day that I don’t have a basic pancake recipe on the blog, so here we are.Meet my new favorite pancake recipe. It’s easy, healthy and vegan, to boot!", 
                      price: 10, 
                      qty: 0, 
                      user_id: a.id, 
                      location_id: c.id, 
                      categories: [s, kf])

Listing.create!(picture: { io: File.open(Rails.root.join('app/assets/images/bowl.jpg')), filename: 'bowl.jpg' }, 
                title: "Buddha Bowl", 
                description: "Super yummi food that is raw and will fill you up for 3 days. Highly reccomend, my absolute favorite, now my family eats olny 3 meals per week, real money saver", 
                price: 12.50, 
                qty: 2, 
                user_id: third.id, 
                location_id: d.id, 
                categories: [r, y, h])

Listing.create!(picture: { io: File.open(Rails.root.join('app/assets/images/chili.jpg')), filename: 'chili.jpg' }, 
                title: "Chili", description: "It’s freezing cold outside, and has been for days. All I want to eat is cozy comfort food like this vegetarian chili recipe. It’s my favorite, and leftovers taste even better the next day.This chili is perfect for watching football games with a crowd, since it’s a hearty meatless option that carnivores will enjoy. Plus, it can be vegan and gluten free if you choose your toppings carefully. This chili will satisfy everyone.", 
                price: 9, 
                qty: 10, 
                user_id: a.id, 
                location_id: d.id, 
                categories: [m, f, y, w])

Listing.create!(picture: {io: File.open(Rails.root.join('app/assets/images/citrus.jpg')), filename: 'citrus.jpg' }, 
                title: "Citrus salad", 
                description: "Every few days or so, our next-door neighbor here in Santa Barbara leaves us the most beautiful citrus fruit by our front door. It grows from an older tree in his yard that was graphed with several different types of varieties of oranges and mandarins all coming out of the same stock. Anyways, the fruit is amazing and this is what inspired this Citrus Salad. Not only does this salad provide a huge burst of immune-boosting vitamin C, but it’s also such a joyful happy salad to make. Seriously, the smell alone will cheer ya up", 
                price: 10.50, 
                qty: 2, 
                user_id: a.id, 
                location_id: c.id, 
                categories: [l, h, r, w])

Listing.create!(picture: {io: File.open(Rails.root.join('app/assets/images/scramble.jpg')), filename: 'scramble.jpg' }, 
                title: "Tofu scramble", 
                description: "Tofu scramble made with soy milk, tumeric and black salt. Comes with fried spinach-capsicum mix and fresh cucumber. Pick-up only.", 
                price: 7.0, 
                qty: 5, 
                user_id: third.id, 
                location_id: c.id, 
                categories: [y, kf])

Listing.create!(picture: {io: File.open(Rails.root.join('app/assets/images/sushi.jpg')), filename: 'sushi.jpg' }, 
                title: "Mock Crab Cucumber Sushi", 
                description: "Crab mix is based on tofu and mayonaise, mixed with different seasonings to achieve seafood-like sushi. Made with brown rice. Pickup only", 
                price: 6, 
                qty: 2, 
                user_id: a.id, 
                location_id: c.id, 
                categories: [y, h, m, snack])

Listing.create!(picture: {io: File.open(Rails.root.join('app/assets/images/burger.jpg')), filename: 'burger.jpg' }, 
                title: "Beetroot burger", 
                description: "Made using morning-star patty, pineapple, beetroot, lettuce and mushrooms with plenty of souce. Pick-up only.", 
                price: 10.50, 
                qty: 2, 
                user_id: a.id, 
                location_id: c.id, 
                categories: [y, h, m])





puts "#{User.count}/3 users were created"
puts "#{Category.count}/13 categories were created"
puts "#{Location.count}/2 locations were created"
puts "#{Listing.count}/7 listings were created"
puts "#{Rating.count}/2 reviews were created"
