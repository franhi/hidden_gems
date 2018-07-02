# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

 # Review.destroy_all
 # Post.delete_all
 # User.destroy_all

User.create!(email: "irma@irma.com", password: "lewagon", address: "brussels")
User.create!(email: "francois@francois.com", password: "lewagon", address: "brussels")
User.create!(email: "john@john.com", password: "lewagon", address: "brussels")
User.create!(email: "erland@erland.com", password: "lewagon", address: "antwerp")

10.times  do
  status =  ["temporary", "permanent"].sample

      Post.create!(
      description: Faker::Hipster.paragraph,
      category: ["general", "entertainment", "sports", "hobby", "design", "art", "mind-blowing", "music", "relax", "food", "drinks"].sample,
      title: ["Buffalo's in brussels", "exclusive rooftop-party", "Le Wagon demo day!", "crazy dance-off", "haunted castle", "Rue D'Isabelle", "tropismes", "la pasionaria", "king albert's jacket", "urban rooms", "druum", "parvis de saint-gilles", "marolles", "matongé", "le 203", "PeÏ et Meï", "Bcentral's coffee", "The mysterious teachers of Le Wagon", "Who's Ana", "het Mim", "Play-Label"].sample,
      status: status,
      street: ["66 rue des Minimes", "Cafe des Minimes", "Square du Solbosch", "ULB", "Rue Lesbroussart"].sample,
      city: "Brussels",
      country: "Belgium",
      photo: Faker::Placeholdit.image,
      begin_date: (Faker::Date.between(Date.today, 5.days.from_now) if status == "temporary"),
      end_date: (Faker::Date.between(5.days.from_now, 10.days.from_now) if status == "temporary"),
      user: User.all.sample
      )
end

Post.all.each do |post|
  rand(1..15).times  do
    Review.create!(
       post: post,
      user: User.all.sample,
      description: ["I think this the best gem I ever saw, I visited it and it really change my life", "WoW, Soooo beautifull", "I have to see this!", "it was so easy finding this, the map is so practical", "I've been there as well, but I do not believe it's the best. The one @place lux is better by my idea", "just amazing", "I will be forever gratefull you posted this!", "I'm in love with this place", "I have to agree on this one.", "Had the time of my life", "Amazing #Astrid Brian", "Breathtaking", "I've never heard of this place before, considering I live next door it felt like an epiphany", "This is nice", "f-ing nice", "That's where I proposed to my wife", "That's where I proposed to my ex-girlfriend", "Life improving!", "wowed me!", "best spot evvaaa", "so gooooood", "are you kidding me?", "Plz don't exaggerate, I thought this was a serious app", "proof that god loves us all", "Anybody would love this place", "mama mia", "almost as good as Le Wagon's demo day", "Isn't that where George lives?"].sample,
      rating: rand(3..5),
    )
  end
end

# update user to User.all.sample before deploying to Heroku!!!!

Favorite.create!(user_id: 1, post_id: 5)
Favorite.create!(user_id: 1, post_id: 6)
Favorite.create!(user_id: 1, post_id: 8)
Favorite.create!(user_id: 1, post_id: 10)
Favorite.create!(user_id: 2, post_id: 5)
Favorite.create!(user_id: 2, post_id: 6)
Favorite.create!(user_id: 2, post_id: 8)
Favorite.create!(user_id: 2, post_id: 10)
Favorite.create!(user_id: 3, post_id: 5)
Favorite.create!(user_id: 3, post_id: 6)
Favorite.create!(user_id: 3, post_id: 8)
Favorite.create!(user_id: 3, post_id: 10)
Favorite.create!(user_id: 4, post_id: 5)
Favorite.create!(user_id: 4, post_id: 6)
Favorite.create!(user_id: 4, post_id: 8)
Favorite.create!(user_id: 4, post_id: 10)

# tag seed creation to add on post and add on user

post_list.each do |title, description, status, street, city, country, photo, begin_date, end_date|
  Post.create( title: title, description: description, status: status, street: street, city: city, country: country, photo: photo, begin_date: begin_date, end_date: end_date )
end

post_list = [
  ["Lazy Jack's", "Referring to a part of a boat, Hidden in the port of Antwerp. The sweetspot for hipsters.", "permanent", "kattendijkdok-Oostkaai, 22", "Antwerp", "Belgium", "https://corporate.apbc.be/upload/1/pers/453_1490.jpg", "", ""]
  ["Black Smoke", "Situated on the rooftop of 'De Koninck's' brewery. The entrance is hidden and the food and drinks are amazing.", "permanent", "Boomgaardstraat, 1", "Antwerp", "Belgium", "https://s3-eu-west-1.amazonaws.com/tablebooker-upload-production/restaurants/18944513/5a6853395683c.770.jpg", "", ""]
  ["Vischmijn", "A special way of making beers in which they need no acid. Some say they have de best draft in the world.", "Riemstraat, 20", "Antwerp", "Belgium", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-_YE2K284AtvZPQdK77cOIbB6SWBv3XRHX2pcjQaaaqEMjC_v", "", ""]
  ["Nick's Café", "Just a bar you would say, Nick's Café is one of the most visited and know bars by all the locals in Antwerp.", "permanent", "Waalsekaai, 18", "Antwerp", "Belgium", "https://u.tfstatic.com/restaurant_photos/665/63665/169/612/nick-s-cafe-salle-54ce5.jpg", "", ""]
  ["Jardim", "a pop-up bar, build out of black containers with a view on the Schelde", "permanent", "Scheldekaai, 28", "Antwerp", "Belgium", "https://www.dnls.be/storage/project/site2/19143739_307116579734037_1830500555822952131_o_2_large.jpg", "", ""]
  ["Vlaeykensgang", "A medieval alley, hedden near the town hall of Antwerp", "permanent", "Oude Koornmarkt, 16", "Antwerp", "Belgium", "https://gvacdn.akamaized.net/Assets/Images_Upload/2018/02/23/Antwerpen_Vlaeykensgang-1.jpg", "", ""]
  ["Havenhuis", "Build on top of the 100-year old fire station entirely made of unequel windows. It looks like a huge rough Diamond.", "permanent", "Zaha Hadidplein, 1", "Antwerp", "Belgium", "https://travellousworld.com/wp-content/uploads/2017/08/Havenhuis.jpg", "",""]
  ["Hendrik Conscience Heritage Library", "Whit a bit of luck the doors are opened in the weekend and you get the chance to have a glance at the more than 600 year-old library.", "permanent", "Hendrik Conscienceplein, 4", "Antwerp", "Belgium", "https://travellousworld.com/wp-content/uploads/2017/08/Hendrik-Conscience-Library.jpg", "", ""]
  ["The Felix Archive", "An archive that describes the history of the port of antwerp since 1505, There are some real treasures in there.", "permanent", "Oude Leeuwenrui, 29", "Antwerp", "Belgium", "https://cdn.theculturetrip.com/wp-content/uploads/2017/05/the-st--felix-warehouse--dave-van-laere-courtesy-of-visit-antwerp.jpg", "", ""]
  ["Gustine", "Healthy organic food, prepared daily with hearth and passion", "permanent", "Rue Middelbourg, 86", "Watermael-Boitsfort", "https://cdn.theculturetrip.com/wp-content/uploads/2016/03/IMG_0499.jpg", "", ""]
  ["Chez Josy", "At Josy’s they serve good, fresh, feminine and organic foods. This small little eatery right in the center of Watermael-Boitsfort offers quality products which make us feel good.", "permanent", "Place Eugène Keym, 15", "Watermael-Boitsfort", "Belgium", "http://cdt29.media.tourinsoft.com/upload/2673DCF3-9445-4428-8390-06C1CFDEF748/CHEZ-JOSY--3-.jpg", "", ""]
  ["Au Pays De L' Epautre", "Typical bakery, baking the bread in a argile oven with traditional recipe in the respect of the tradition", "permanent", "Avenue Pré des Agneaux, 25", "Auderghem", "Belgium", "https://i0.wp.com/carnetsdenormann.com/wp-content/uploads/2015/03/015.jpg", "", ""]
  ["Café des Minimes", "Located between the very authentic neighborhoods of Marolles and Sablon, Café des Minimes offers a space where you can relax with friends. Local and seasonal products are showcased and drinks have been selected with special attention. Our wines are all natural while our beers are from micro-breweries. Moreover, the Café des Minimes also wants to be a cultural space where any type of event can take place.", "permanent", "Rue des Minimes, 66", "Brussels", "Belgium", "https://www.smarksthespots.com/wp-content/uploads/2013/10/arriere_pays_brussels_1.jpg", "", ""]
  ["L'Atelier", "Small bar reserved for the true beer lovers with a large selection of trappist beer and seasonal beers, the bar looks usually close (but rarely is!) making this a place where you will meet only a few people and enjoy a timeless atmosphere.", "permanent", "Rue elise, 77", "Ixelles", "Belgium", "https://i.pinimg.com/originals/74/fc/f5/74fcf5692dc1d7bb9d220d4399253077.jpg", "", ""]
  ["Poki Poké", "Poké (pronounced poh-kay) is a refreshing seafood salad originating from the islands of Hawaii. The word Poke itself is actually the Hawaiian verb for “section” or to “slice or cut”. Traditionally Poke is made from cuts of tuna or octopus, adding some flavoured rice and several different toppings. At PokiPoké, we decided to give it different forms and you will be able to eat either Poké bowls or Pokirrito", "permanent", "Chaussée d'Ixelles, 331", "Ixelles", "Belgium", "https://www.thebulletin.be/sites/default/files/styles/big_article/public/poke.jpg", "",""]
  ["Bao bang bang", "Asian street food par excellence, the BAO is a tasty, white, smooth, steamed bun, of which there are many delicious variations in different countries.", "permanent", "Rue de l'Aqueduc,155", "Ixelles", "Belgium", "http://lacuisineaquatremains.blogs.lalibre.be/media/02/00/3930683260.jpg", "", ""]
  ["Johnny Velvet", "Clothing store for men and women where upcoming brands are tried out to see the respond of the market, on the verge of trendy brands and unknown brands.", "permanent", "Rue de l'Hôpital, 1", "Brussels", "Belgium", "https://www.likealocalguide.com/media/cache/78/33/78338d1806337318245a3aa0935d65a9.jpg", "", ""]
  ["Caroline record shop", "Expert record shop for vinyls, where you can find everything from second hands records to the latest album released in almost every genre of music.", "permanent", "Boulevard Anspach, 101", "Brussels", "Belgium", "https://cdn-images-1.medium.com/max/1600/1*d44nvek_Wrkm4VaiMBxuPQ.jpeg", "", ""]
  ["Le Perroquet", "Spacious corner bar & restaurant with art nouveau-style interior, stained glass & outdoor seating.", "permanent", "Rue Watteeu, 31", "Brussels", "Belgium", "http://www.sablon.org/wp-content/uploads/2015/09/4086_010.jpg", "", ""]
  ["Jam Hotel Rooftop", "Rooftop bar where some summer sales are conducted once a month for local producers of clothing and accessories.", "permanent", "Chaussée de Charleroi, 132", "Brussels", "Belgium", "https://exp.cdn-hotels.com/hotels/16000000/15690000/15682100/15682089/0561c70d_z.jpg", "", ""]
  ["PLAY-LABEL Rooftop bar", "The rooftop bar is located between two of the most beautiful areas in Brussels, The Sablon and the Marolles, where you can find sets from independent artists playing in B2B.", "temporary", "Boulevard de l’Empereur, 36", "Brussels", "Belgium", "https://images.bruzz.be/import/article_media/images/playlabelrooftop.jpg?auto=format&crop=edges%252C%2520entropy&fit=crop&ixlib=php-1.1.0&q=95&w=640&s=c444317279b6070930b84fe614e1de18", "May, 2018", "September, 2018"]
]

# specific tag per post

tag_list = [
  ["fun", "culture", "sports", "hobby", "design", "art", "mind-blowing", "music", "relax", "food", "drinks", "yummy-yummy", "with-a-view", "sunday-chilling", "TGIF", "love-books", "stays forever", "starchitects", "monk beers", "crafty", "gemmy-gem!"]
]
