# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(title: genre_name)
#   end
require "open-uri"

puts "Cleaning up the database.."
Message.destroy_all
Chatroom.destroy_all
Swap.destroy_all
Item.destroy_all
Category.destroy_all
Outfit.destroy_all
User.destroy_all

puts "Creating users"
camilla = User.create!(
  username: "camilla",
  first_name: "Camilla",
  last_name: "Ligovic",
  password: "123456",
  email: "camilla.ligovic@gmail.com",
  address: "Pl. del Diamant, 9",
  postcode: "08012",
  country: "Spain"
)

gavin = User.create!(
  username: "gavin",
  first_name: "Gavin",
  last_name: "Wotton",
  password: "abcdef",
  email: "gavin.wotton@gmail.com",
  address: "Av. Diagonal, 579",
  postcode: "08029",
  country: "Spain"
)

serena = User.create!(
  username: "serena",
  first_name: "Serena",
  last_name: "Mellor",
  password: "234567",
  email: "serena@gmail.com",
  address: "C/ de Ferlandina, 20",
  postcode: "08001",
  country: "Spain"
)

sandra = User.create!(
  username: "sandra",
  first_name: "Sandra",
  last_name: "Luukas",
  password: "654321",
  email: "sandra@gmail.com",
  address: "Pg. de Gràcia, 27",
  postcode: "08012",
  country: "Spain"
)


puts "Creating categories"

shoes = Category.create!(title: "Shoes", position: "bottom")
shoes_image = URI.open("https://images.unsplash.com/photo-1565814636199-ae8133055c1c?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
shoes.photo.attach(io: shoes_image, filename: "image/shoes")
shoes.save!
puts "."

shirts = Category.create!(title: "Shirts", position: "top")
shirts_image = URI.open("https://images.unsplash.com/photo-1586363104862-3a5e2ab60d99?q=80&w=2971&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
shirts.photo.attach(io: shirts_image, filename: "shirts.jpg")
shirts.save
puts "."

dresses = Category.create!(title: "Dresses", position: "dress")
dresses_image = URI.open("https://images.pexels.com/photos/985635/pexels-photo-985635.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
dresses.photo.attach(io: dresses_image, filename: "image/dresses")
dresses.save
puts "."

trousers = Category.create!(title: "Trousers", position: "middle")
trousers_image = URI.open("https://images.pexels.com/photos/1598507/pexels-photo-1598507.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
trousers.photo.attach(io: trousers_image, filename: "image/trousers")
trousers.save
puts "."

accessories = Category.create!(title: "Accessories", position: "accessories")
accessories_image = URI.open("https://images.pexels.com/photos/1453008/pexels-photo-1453008.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
accessories.photo.attach(io: accessories_image, filename: "image/accessories")
accessories.save
puts "."

jackets = Category.create!(title: "Jackets", position: "top")
jackets_image = URI.open("https://images.pexels.com/photos/16170/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
jackets.photo.attach(io: jackets_image, filename: "image/jackets")
jackets.save
puts "."

knitwear = Category.create!(title: "Knitwear", position: "top")
knitwear_image = URI.open("https://images.pexels.com/photos/6630834/pexels-photo-6630834.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
knitwear.photo.attach(io: knitwear_image, filename: "image/knitwear")
knitwear.save
puts "."
hats = Category.create!(title: "Hats", position: "hat")
hats_image = URI.open("https://images.pexels.com/photos/458649/pexels-photo-458649.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
hats.photo.attach(io: hats_image, filename: "image/hats")
hats.save
puts "."

puts "Creating items"

silver_dress_image = File.open("app/assets/images/glitter.png")
silver_dress = Item.new(title: "Glitter cocktail dress", description: "A stunning dress for special occasions.", user: camilla, category: dresses)
silver_dress.photo.attach(io: silver_dress_image, filename: "image/silver_dress")
silver_dress.save

floral_dress_image = File.open("app/assets/images/floral.png")
floral_dress = Item.new(title: "Floral Summer Dress", description: "Light and breezy for a perfect summer day.", user: sandra, category: dresses)
floral_dress.photo.attach(io: floral_dress_image, filename: "image/floral_dress")
floral_dress.save

white_shirt = File.open("app/assets/images/whiteshirt.png")
shirt = Item.new(title: "Classic White Button-Up", description: "A timeless and versatile piece for any wardrobe.",swappable: true, user: sandra, category: shirts)
shirt.photo.attach(io: white_shirt, filename: "image/white_shirt")
shirt.save

striped_tee_image = File.open("app/assets/images/striped.png")
striped_tee = Item.new(title: "Casual Striped Long Sleeve Shirt", description: "Comfortable and stylish for everyday wear.", user: camilla, category: shirts)
striped_tee.photo.attach(io: striped_tee_image, filename: "image/striped_tee")
striped_tee.save

denim_shirt_image = File.open("app/assets/images/denim.png")
denim_shirt = Item.new(title: "Denim Chambray Shirt", description: "A versatile denim shirt for a laid-back look.", swappable: true, user: camilla, category: shirts)
denim_shirt.photo.attach(io: denim_shirt_image, filename: "image/denim_shirt")
denim_shirt.save

black_jacket_image = File.open("app/assets/images/jacket.png")
black_jacket = Item.new(title: "Black Jacket", description: "Trendy black jacket for any occasion.", swappable: true, user: gavin, category: jackets)
black_jacket.photo.attach(io: black_jacket_image, filename: "image/black_jacket")
black_jacket.save

hawaiian_shirt_image = File.open("app/assets/images/hawaii.png")
hawaiian_shirt = Item.new(title: "Printed Hawaiian Shirt", description: "Channel tropical vibes with a fun printed Hawaiian shirt.",swappable: true, user: camilla, category: shirts)
hawaiian_shirt.photo.attach(io: hawaiian_shirt_image, filename: "image/hawaiian_shirt")
hawaiian_shirt.save

long_sleeve_image = File.open("app/assets/images/henley.png")
long_sleeve = Item.new(title: "Long Sleeve Henley", description: "Casual and cool with a laid-back vibe.",swappable: true, user: sandra, category: shirts)
long_sleeve.photo.attach(io: long_sleeve_image, filename: "image/long_sleeve")
long_sleeve.save

wide_leg_image = File.open("app/assets/images/beige.png")
wide_leg = Item.new(title: "Wide Leg Trousers", description: "Make a statement with these fashionable wide-leg trousers.", user: sandra, category: trousers)
wide_leg.photo.attach(io: wide_leg_image, filename: "image/wide_leg")
wide_leg.save

leggings_image = File.open("app/assets/images/leggings.png")
leggings = Item.new(title: "Athleisure Leggings", description: "Perfect for workouts or casual athleisure style.",swappable: true, user: sandra, category: trousers)
leggings.photo.attach(io: leggings_image, filename: "image/leggings")
leggings.save

culottes_image = File.open("app/assets/images/velvet.png")
culottes = Item.new(title: "Cropped Culottes", description: "Stay on-trend with these chic and comfortable culottes.", swappable: true, user: camilla, category: trousers)
culottes.photo.attach(io: culottes_image, filename: "image/culottes")
culottes.save

cargos_image = File.open("app/assets/images/cargo.png")
cargos = Item.new(title: "Cargo Pants", description: "A versatile choice with plenty of pockets for a utilitarian look.",swappable: true, user: serena, category: trousers)
cargos.photo.attach(io: cargos_image, filename: "image/cargos")
cargos.save

palazzo_image = File.open("app/assets/images/wide.png")
palazzo = Item.new(title: "High Waist Palazzo Pants", description: "Achieve a glamorous look with these high-waisted palazzo pants.",swappable: true, user: gavin, category: trousers)
palazzo.photo.attach(io: palazzo_image, filename: "image/palazzo")
palazzo.save

shorts_image = File.open("app/assets/images/shorts.png")
shorts = Item.new(title: "Denim Shorts", description: "Casual and cool for warm weather styling.", user: sandra, category: trousers)
shorts.photo.attach(io: shorts_image, filename: "image/shorts")
shorts.save

chinos_image = File.open("app/assets/images/capri.png")
chinos = Item.new(title: "Chino Trousers", description: "A versatile and polished option for various occasions.", user: camilla, category: trousers)
chinos.photo.attach(io: chinos_image, filename: "image/chinos")
chinos.save

sneakers_image = File.open("app/assets/images/nb.png")
sneakers = Item.new(title: "Classic Sneakers", description: "Versatile and comfortable for everyday wear.",swappable: true, user: sandra, category: shoes)
sneakers.photo.attach(io: sneakers_image, filename: "image/sneakers")
sneakers.save

sandals_image = File.open("app/assets/images/sandals.png")
sandals = Item.new(title: "Sandals", description: "Comfortable summer sandals", user: camilla, category: shoes)
sandals.photo.attach(io: sandals_image, filename: "image/sandals")
sandals.save

slip_ons_image = File.open("app/assets/images/vans.png")
slip_ons = Item.new(title: "Casual Slip Ons", description: "Easy and stylish slip-on shoes for a laid-back look.", swappable: true, user: serena, category: shoes)
slip_ons.photo.attach(io: slip_ons_image, filename: "image/slip-ons")
slip_ons.save

high_heels_image = File.open("app/assets/images/heels.png")
high_heels = Item.new(title: "High Heel Pumps", description: "Black essentials in every girls closets",swappable: true, user: sandra, category: shoes)
high_heels.photo.attach(io: high_heels_image, filename: "image/high_heels")
high_heels.save

boots_image = File.open("app/assets/images/boots.png")
boots = Item.new(title: "Fashionable Boots", description: "Stay on-trend with these stylish and comfortable boots.", swappable: true,user: camilla, category: shoes)
boots.photo.attach(io: boots_image, filename: "image/boots")
boots.save

oxford_shoes_image = File.open("app/assets/images/oxford.png")
oxford_shoes = Item.new(title: "Classic Oxford Shoes", description: "Timeless elegance for a polished look.",swappable: true, user: camilla, category: shoes)
oxford_shoes.photo.attach(io: oxford_shoes_image, filename: "image/oxford_shoes")
oxford_shoes.save

jeans_image = File.open("app/assets/images/skinny.png")
jeans = Item.new(title: "Slim Fit Jeans", description: "A classic staple for casual and versatile outfits.",swappable: true, user: sandra, category: trousers)
jeans.photo.attach(io: jeans_image, filename: "image/jeans")
jeans.save

green_sweater_image = File.open("app/assets/images/green.png")
green_sweater = Item.new(title: "Zip-up sweater", description: "Stay cozy and on-trend with a classic zip-up sweater.",swappable: true, user: camilla, category: knitwear)
green_sweater.photo.attach(io: green_sweater_image, filename: "image/green_sweater")
green_sweater.save

white_sweater_image = File.open("app/assets/images/whitesweater.png")
white_sweater = Item.new(title: "White sweater", description: "A polished choice for a smart-casual look.", swappable: true, user: serena, category: knitwear)
white_sweater.photo.attach(io: white_sweater_image, filename: "image/white_sweater")
white_sweater.save

linen_image = File.open("app/assets/images/linen.png")
linen = Item.new(title: "Linen Short Sleeve Shirt", description: "Perfect for warm weather with a breathable linen fabric.", swappable: true, user: camilla, category: shirts)
linen.photo.attach(io: linen_image, filename: "image/linen")
linen.save

crossbody_bag_image = File.open("app/assets/images/bag.png")
crossbody_bag = Item.new(title: "Chic Crossbody Bag", description: "A stylish and convenient accessory for on-the-go.", swappable: true, user: camilla, category: accessories)
crossbody_bag.photo.attach(io: crossbody_bag_image, filename: "image/crossbody_bag")
crossbody_bag.save

beanie_image = File.open("app/assets/images/beanie.png")
beanie = Item.new(title: "Yellow beanie", description: "An essential for the cold.", swappable: true, user: sandra, category: hats)
beanie.photo.attach(io: beanie_image, filename: "image/beanie")
beanie.save

beret_image = File.open("app/assets/images/beret.png")
beret = Item.new(title: "Redc beret", description: "100% wool", swappable: true, user: sandra, category: hats)
beret.photo.attach(io: beret_image, filename: "image/beret")
beret.save

cap_image = File.open("app/assets/images/cap.png")
cap = Item.new(title: "Baseball cap", description: "100% cotton", swappable: true, user: camilla, category: hats)
cap.photo.attach(io: cap_image, filename: "image/cap")
cap.save

fisherman_image = File.open("app/assets/images/fisherman_hat.png")
fisherman = Item.new(title: "Fisherman cap", description: "A traditional, greek style fisherman cap with a belt over visor.", swappable: true, user: sandra, category: hats)
fisherman.photo.attach(io: fisherman_image, filename: "image/fisherman")
fisherman.save

hat_image = File.open("app/assets/images/hat.png")
hat = Item.new(title: "Black hat", description: "Thick felt hat with ribbon around the brim.", swappable: true, user: camilla, category: hats)
hat.photo.attach(io: hat_image, filename: "image/hat")
hat.save

coat_image = File.open("app/assets/images/black_coat.png")
coat = Item.new(title: "Black coat", description: "High quality crafted classic coat.", swappable: true, user: camilla, category: jackets)
coat.photo.attach(io: coat_image, filename: "image/coat")
coat.save

sherpa_image = File.open("app/assets/images/sherpa.png")
sherpa = Item.new(title: "Denim Trucker Jacket", description: "The shearling collar and lining comes in a contrasting white colour and will keep you nice and warm.", swappable: true, user: sandra, category: jackets)
sherpa.photo.attach(io: sherpa_image, filename: "image/sherpa")
sherpa.save

brown_image = File.open("app/assets/images/brown_jacket.png")
brown = Item.new(title: "Brown sherpa jacket", description: "Stay warm this winter.", swappable: true, user: gavin, category: jackets)
brown.photo.attach(io: brown_image, filename: "image/brown")
brown.save

trench_image = File.open("app/assets/images/trench.png")
trench = Item.new(title: "Beige trench coat", description: "Timeless classic", swappable: true, user: camilla, category: jackets)
trench.photo.attach(io: trench_image, filename: "image/trench")
trench.save

blue_sweater_image = File.open("app/assets/images/bluesweater.png")
blue_sweater = Item.new(title: "Winter Sweater", description: "Basic and beautiful design.", swappable: true, user: gavin, category: knitwear)
blue_sweater.photo.attach(io: blue_sweater_image, filename: "image/blue_sweater")
blue_sweater.save

striped_sweater_image = File.open("app/assets/images/striped2.png")
striped_sweater = Item.new(title: "Striped knitted sweater", description: "High neck with half zipper and long sleeves.", swappable: true, user: sandra, category: knitwear)
striped_sweater.photo.attach(io: striped_sweater_image, filename: "image/striped_sweater")
striped_sweater.save

tote_image = File.open("app/assets/images/tote.png")
tote = Item.new(title: "Brown tote", description: "Spacious bag", swappable: true, user: serena, category: accessories)
tote.photo.attach(io: tote_image, filename: "image/tote")
tote.save

backbag_image = File.open("app/assets/images/backbag.png")
backbag = Item.new(title: "Backbag", description: "Water resistant bag", swappable: true, user: gavin, category: accessories)
backbag.photo.attach(io: backbag_image, filename: "image/backbag")
backbag.save


sunday_brunch = Outfit.create!(name:"Sunday brunch", user:sandra)
OutfitItem.create!(outfit: sunday_brunch, item: denim_shirt )
OutfitItem.create!(outfit: sunday_brunch, item: wide_leg )
OutfitItem.create!(outfit: sunday_brunch, item: sneakers )

datenight = Outfit.create!(name: "Date night", user:camilla)
OutfitItem.create!(outfit: datenight, item: floral_dress )
OutfitItem.create!(outfit: datenight, item: high_heels )
OutfitItem.create!(outfit: datenight, item: crossbody_bag )

office = Outfit.create!(name: "Casual office look", user:serena)
OutfitItem.create!(outfit: office, item: white_sweater )
OutfitItem.create!(outfit: office, item: culottes )
OutfitItem.create!(outfit: office, item: oxford_shoes)

beach_day = Outfit.create!(name: "Beach day", user:gavin)
OutfitItem.create!(outfit: beach_day, item: hawaiian_shirt )
OutfitItem.create!(outfit: beach_day, item: shorts )
OutfitItem.create!(outfit: beach_day, item: sandals)

puts "Created  #{Item.count} items"

# seeds.rb or any other Ruby file
require 'faker'

# Generate a random address
address = Faker::Address.full_address
puts "Fake Address: #{address}"

# Generate a random city
city = Faker::Address.city
puts "Fake City: #{city}"

# Generate a random country
country = Faker::Address.country
puts "Fake Country: #{country}"

# Generate a random latitude and longitude
latitude = Faker::Address.latitude
longitude = Faker::Address.longitude
puts "Fake Latitude: #{latitude}, Fake Longitude: #{longitude}"
