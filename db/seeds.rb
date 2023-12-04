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
Item.destroy_all
Category.destroy_all
Outfit.destroy_all
User.destroy_all

puts "Creating users"
camilla = User.create!(username: "camilla", first_name: "Camilla", last_name: "Ligovic", password: "123456", email: "camilla.ligovic@gmail.com")
gavin = User.create!(username: "gavin", first_name: "Gavin", last_name: "Wotton", password: "abcdef", email: "gavin.wotton@gmail.com")
serena = User.create!(username: "serena", first_name: "Serena", last_name: "Mellor", password: "234567", email: "serena@gmail.com")
sandra = User.create!(username: "sandra", first_name: "Sandra", last_name: "Luukas", password: "654321", email: "sandra@gmail.com")

puts "Creating categories"
shoes = Category.create!(title: "Shoes")
shirts = Category.create!(title: "Shirts")
dresses = Category.create!(title: "Dresses")
trousers = Category.create!(title: "Trousers")
accessories = Category.create!(title: "Accessories")
jackets = Category.create!(title: "Jackets")
knitwear = Category.create!(title: "Knitwear")

puts "Creating items"

silver_dress_image = URI.open("https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F20%2F67%2F2067c4a0b6f06ca18856126ff277e74718fd539c.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_dresses_longsleevedress%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]")
silver_dress = Item.new(title: "Glitter cocktail dress", description: "A stunning dress for special occasions.", user: camilla, category: dresses)
silver_dress.photo.attach(io: silver_dress_image, filename: "image/silver_dress")
silver_dress.save

floral_dress_image = URI.open("https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F05%2F38%2F0538e7e1bfc64212f3cc49dc1f290910b6ea9f70.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]")
floral_dress = Item.new(title: "Floral Summer Dress", description: "Light and breezy for a perfect summer day.", user: sandra, category: dresses)
floral_dress.photo.attach(io: floral_dress_image, filename: "image/floral_dress")
floral_dress.save

white_shirt = URI.open("https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F38%2F95%2F3895ed5288fd623eea914dbf8bc0bd3af6ea0657.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]")
shirt = Item.new(title: "Classic White Button-Up", description: "A timeless and versatile piece for any wardrobe.", user: sandra, category: shirts)
shirt.photo.attach(io: white_shirt, filename: "image/white_shirt")
shirt.save

striped_tee_image = URI.open("https://img01.ztat.net/article/spp-media-p1/ccbca23e52ac4aa9aeb724f91840fda2/1f2aa1e1ca16466e931c686b684532ff.jpg?imwidth=762&filter=packshot")
striped_tee = Item.new(title: "Casual Striped Long Sleeve Shirt", description: "Comfortable and stylish for everyday wear.", user: camilla, category: shirts)
striped_tee.photo.attach(io: striped_tee_image, filename: "image/striped_tee")
striped_tee.save

denim_shirt_image = URI.open("https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F79%2F47%2F794720afe7244f2e40ff0084594ba89e4b94efe4.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_shirtsblouses_shirts%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]")
denim_shirt = Item.new(title: "Denim Chambray Shirt", description: "A versatile denim shirt for a laid-back look.", swappable: true, user: camilla, category: shirts)
denim_shirt.photo.attach(io: denim_shirt_image, filename: "image/denim_shirt")
denim_shirt.save

black_jacket_image = URI.open("https://img01.ztat.net/article/spp-media-p1/76fd75dc1dc94f48898db3dd6d5ae882/b4b816d0a2a34bb4a447dee5bdcee1bb.jpg?imwidth=1800&filter=packshot")
black_jacket = Item.new(title: "Printed Hawaiian Shirt", description: "Channel tropical vibes with a fun printed Hawaiian shirt.", swappable: true, user: gavin, category: jackets)
black_jacket.photo.attach(io: black_jacket_image, filename: "image/black_jacket")
black_jacket.save

hawaiian_shirt_image = URI.open("https://img01.ztat.net/article/spp-media-p1/7995803d327e4451bf09cf59507ac2b8/1f9b3649ce1d48b2ab1d8679f57889c3.jpg?imwidth=762&filter=packshot")
hawaiian_shirt = Item.new(title: "Printed Hawaiian Shirt", description: "Channel tropical vibes with a fun printed Hawaiian shirt.", user: camilla, category: shirts)
hawaiian_shirt.photo.attach(io: hawaiian_shirt_image, filename: "image/hawaiian_shirt")
hawaiian_shirt.save

long_sleeve_image = URI.open("https://img.hollisterco.com/is/image/anf/KIC_339-2670-1153-400_prod1.jpg?policy=product-extra-large")
long_sleeve = Item.new(title: "Long Sleeve Henley", description: "Casual and cool with a laid-back vibe.",swappable: true, user: sandra, category: shirts)
long_sleeve.photo.attach(io: long_sleeve_image, filename: "image/long_sleeve")
long_sleeve.save

wide_leg_image = URI.open("https://img01.ztat.net/article/spp-media-p1/2a83622658c84c31b4933b4bd4c1e33c/837c4c4c076f4b51a68ba813d76ed5ba.jpg?imwidth=762&filter=packshot")
wide_leg = Item.new(title: "Wide Leg Trousers", description: "Make a statement with these fashionable wide-leg trousers.", user: sandra, category: trousers)
wide_leg.photo.attach(io: wide_leg_image, filename: "image/wide_leg")
wide_leg.save

leggings_image = URI.open("https://www.emp-online.es/dw/image/v2/BBQV_PRD/on/demandware.static/-/Sites-master-emp/default/dw58d93b15/images/5/3/0/7/530725a.jpg?sfrm=png")
leggings = Item.new(title: "Athleisure Leggings", description: "Perfect for workouts or casual athleisure style.", user: sandra, category: trousers)
leggings.photo.attach(io: leggings_image, filename: "image/leggings")
leggings.save

culottes_image = URI.open("https://pix.bonprix.es/imgc/0/0/2/3/1/2/5/1/7/2/_640/23125172/pantalon-culotte-de-pana-elastica-con-cintura-comoda-largo-7-8-verde-oliva-oscuro.jpg")
culottes = Item.new(title: "Cropped Culottes", description: "Stay on-trend with these chic and comfortable culottes.", swappable: true, user: camilla, category: trousers)
culottes.photo.attach(io: culottes_image, filename: "image/culottes")
culottes.save

cargos_image = URI.open("https://img01.ztat.net/article/spp-media-p1/0676f7e501094484ad42932a13784bd8/f8e853b45cc442888df3b91f8d1b2018.jpg?imwidth=1800&filter=packshot")
cargos = Item.new(title: "Cargo Pants", description: "A versatile choice with plenty of pockets for a utilitarian look.", user: serena, category: trousers)
cargos.photo.attach(io: cargos_image, filename: "image/cargos")
cargos.save

palazzo_image = URI.open("https://img01.ztat.net/article/spp-media-p1/a9ec8baabec04652ba64ee90215f03a8/e85f60a4e6b5485885b41361a5bae8ef.jpg?imwidth=762&filter=packshot")
palazzo = Item.new(title: "High Waist Palazzo Pants", description: "Achieve a glamorous look with these high-waisted palazzo pants.", user: gavin, category: trousers)
palazzo.photo.attach(io: palazzo_image, filename: "image/palazzo")
palazzo.save

shorts_image = URI.open("https://img01.ztat.net/article/spp-media-p1/fe943fdd75b1455e85a1598aced91534/fff2f6ebef8d40fba3e17ed2a1932629.jpg?imwidth=1800&filter=packshot")
shorts = Item.new(title: "Denim Shorts", description: "Casual and cool for warm weather styling.", user: sandra, category: trousers)
shorts.photo.attach(io: shorts_image, filename: "image/shorts")
shorts.save

chinos_image = URI.open("https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/455482/item/goods_30_455482.jpg?width=722&impolicy=quality_70&imformat=chrome")
chinos = Item.new(title: "Chino Trousers", description: "A versatile and polished option for various occasions.", user: camilla, category: trousers)
chinos.photo.attach(io: chinos_image, filename: "image/chinos")
chinos.save

sneakers_image = URI.open("https://cdn.deporvillage.com/cdn-cgi/image/h=1800,w=1800,dpr=1,f=auto,q=75,fit=contain,background=white/product/nb-wl574evw_003.jpg")
sneakers = Item.new(title: "Classic Sneakers", description: "Versatile and comfortable for everyday wear.",swappable: true, user: sandra, category: shoes)
sneakers.photo.attach(io: sneakers_image, filename: "image/sneakers")
sneakers.save

sandals_image = URI.open("https://www.birkenstock.com/dw/image/v2/BBBF_PRD/on/demandware.static/-/Sites-master-catalog/default/dw0616ee1f/1023247/1023247_pair.jpg?sw=848&sh=848&strip=false")
sandals = Item.new(title: "Sandals", description: "Comfortable summer sandals", user: camilla, category: shoes)
sandals.photo.attach(io: sandals_image, filename: "image/sandals")
sandals.save

slip_ons_image = URI.open("https://img01.ztat.net/article/spp-media-p1/4c87132b239630d488c7473b4d129979/b577e92a16c34d59a0b002a2030bef2c.jpg?imwidth=1800")
slip_ons = Item.new(title: "Casual Slip Ons", description: "Easy and stylish slip-on shoes for a laid-back look.", user: serena, category: shoes)
slip_ons.photo.attach(io: slip_ons_image, filename: "image/slip-ons")
slip_ons.save

high_heels_image = URI.open("https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F3e%2F30%2F3e30e8288d545ea19459118f4ba11dd7f3161fd5.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D")
high_heels = Item.new(title: "High Heel Pumps", description: "Black essentials in every girls closets",swappable: true, user: sandra, category: shoes)
high_heels.photo.attach(io: high_heels_image, filename: "image/high_heels")
high_heels.save

boots_image = URI.open("https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fcb%2F74%2Fcb744c7a268f06c1aa80108cd1fcc215cbe206e2.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_shoes_ankle_boots%5D%2Ctype%5BDESCRIPTIVEDETAIL%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]")
boots = Item.new(title: "Fashionable Boots", description: "Stay on-trend with these stylish and comfortable boots.", swappable: true,user: camilla, category: shoes)
boots.photo.attach(io: boots_image, filename: "image/boots")
boots.save

oxford_shoes_image = URI.open("https://img01.ztat.net/article/spp-media-p1/bb0c339377083ddb81504e5d266f862a/93c9f18181d24bcf881a64569d23a99a.jpg?imwidth=1800")
oxford_shoes = Item.new(title: "Classic Oxford Shoes", description: "Timeless elegance for a polished look.",swappable: true, user: camilla, category: shoes)
oxford_shoes.photo.attach(io: oxford_shoes_image, filename: "image/oxford_shoes")
oxford_shoes.save

jeans_image = URI.open("https://static.pullandbear.net/2/photos//2023/I/0/1/p/7686/331/427/7686331427_2_6_8.jpg?t=1687963466135&imwidth=1024")
jeans = Item.new(title: "Slim Fit Jeans", description: "A classic staple for casual and versatile outfits.",swappable: true, user: sandra, category: trousers)
jeans.photo.attach(io: jeans_image, filename: "image/jeans")
jeans.save

green_sweater_image = URI.open("https://pix.bonprix.es/imgc/0/0/2/1/2/2/9/4/0/4/_640/21229404/jersey-con-cremallera-caqui-oscuro.jpg")
green_sweater = Item.new(title: "Zip-up sweater", description: "Stay cozy and on-trend with a classic zip-up sweater.",swappable: true, user: camilla, category: knitwear)
green_sweater.photo.attach(io: green_sweater_image, filename: "image/green_sweater")
green_sweater.save

white_sweater_image = URI.open("https://cdn.laredoute.com/products/6/4/c/64c9d720bb0ca3fece5b7f899a6d5c05.jpg?width=1200&dpr=1")
white_sweater = Item.new(title: "White sweater", description: "A polished choice for a smart-casual look.", user: serena, category: knitwear)
white_sweater.photo.attach(io: white_sweater_image, filename: "image/white_sweater")
white_sweater.save

linen_image = URI.open("https://imgproxy.oascompany.com/imgproxy/resize:fit/width:1280/quality:90/aHR0cHM6Ly9vYXMuY2VudHJhY2RuLm5ldC9jbGllbnQvZHluYW1pYy9pbWFnZXMvMzUxXzAzZjIzNzcxZTYtYXJteS1jdWJhLXRlcnJ5LXNoaXJ0LTcwMDMtMzctYS1vcmlnaW5hbC5qcGc=.jpg")
linen = Item.new(title: "Linen Short Sleeve Shirt", description: "Perfect for warm weather with a breathable linen fabric.", swappable: true, user: camilla, category: shirts)
linen.photo.attach(io: linen_image, filename: "image/linen")
linen.save

crossbody_bag_image = URI.open("https://asset1.cxnmarksandspencer.com/is/image/mands/Faux-Leather-Cross-Body-Bag/SD_01_T01_9846C_Y0_X_EC_90?$PDP_IMAGEGRID_ZOOM_LG$")
crossbody_bag = Item.new(title: "Chic Crossbody Bag", description: "A stylish and convenient accessory for on-the-go.",swappable: true, user: camilla, category: accessories)
crossbody_bag.photo.attach(io: crossbody_bag_image, filename: "image/crossbody_bag")
crossbody_bag.save


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

beach_day = Outfit.create!(name: "Easy look for exploring beaches", user:gavin)
OutfitItem.create!(outfit: beach_day, item: hawaiian_shirt )
OutfitItem.create!(outfit: beach_day, item: shorts )
OutfitItem.create!(outfit: beach_day, item: sandals)


puts "Created  #{Item.count} items"
