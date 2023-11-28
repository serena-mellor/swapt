# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
camilla = User.create!(username: "camilla", first_name: "Camilla", last_name: "Ligovic", password: "123456", email: "camilla.ligovic@gmail.com")
gavin = User.create!(username: "gavin", first_name: "Gavin", last_name: "Wotton", password: "abcdef", email: "gavin.wotton@gmail.com")
serena = User.create!(username: "serena", first_name: "Serena", last_name: "Mellor", password: "234567", email: "serena@gmail.com")
sandra = User.create!(username: "sandra", first_name: "Sandra", last_name: "Luukas", password: "654321", email: "sandra@gmail.com")


shoes = Category.create!(title: "Shoes")
shirts = Category.create!(title: "Shirts")
hats = Category.create!(title: "Hats")
dresses = Category.create!(title: "Dresses")
trousers = Category.create!(title: "Trousers")
accessories = Category.create!(title: "Accessories")
jackets = Category.create!(title: "Jackets")
skirts = Category.create!(title: "Skirts")
knitwear = Category.create!(title: "Knitwear")
jeans = Category.create!(title: "Jeans")
