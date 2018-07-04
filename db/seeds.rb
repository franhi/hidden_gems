# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

  Report.destroy_all
  Review.destroy_all
  Favorite.destroy_all
  TagPost.destroy_all
  TagUser.destroy_all
  Tag.destroy_all
  Post.delete_all
  User.destroy_all


User.create!(email: "irma@irma.com", username: "Irma", password: "lewagon", address: "Cantersteen 10, 1000 Bruxelles")
User.create!(email: "francois@francois.com", username: "Francois", password: "lewagon", address: "Cantersteen 10, 1000 Bruxelles")
User.create!(email: "john@john.com", username: "John", password: "lewagon", address: "Cantersteen 10, 1000 Bruxelles")
User.create!(email: "erland@erland.com", username: "Erland", password: "lewagon", address: "Cantersteen 10, 1000 Bruxelles")

# 10.times do
#   status =  ["temporary", "permanent"].sample

#       Post.create!(
#       description: Faker::Hipster.paragraph,
#       category: ["general", "entertainment", "sports", "hobby", "design", "art", "mind-blowing", "music", "relax", "food", "drinks"].sample,
#       title: ["Buffalo's in brussels", "Exclusive rooftop party", "Le Wagon demo day!", "crazy dance off", "haunted castle", "Rue D'Isabelle", "tropismes", "la pasionaria", "king albert's jacket", "urban rooms", "Druum", "Parvis de saint-gilles", "Marolles", "matongé", "le 203", "PeÏ et Meï", "Bcentral's coffee", "The mysterious teachers of Le Wagon", "Het Mim", "Play Label"].sample,
#       status: status,
#       street: ["66 rue des Minimes", "Cafe des Minimes", "Square du Solbosch", "ULB", "Rue Lesbroussart"].sample,
#       city: "Brussels",
#       country: "Belgium",
#       photo: Faker::Placeholdit.image,
#       begin_date: (Faker::Date.between(Date.today, 5.days.from_now) if status == "temporary"),
#       end_date: (Faker::Date.between(5.days.from_now, 10.days.from_now) if status == "temporary"),
#       user: User.all.sample
#       )
# end

# Post.all.each do |post|
#   rand(1..15).times  do
#     Review.create!(
#        post: post,
#       user: User.all.sample,
#       description: ["I think this the best gem I ever saw, I visited it and it really change my life", "WoW, Soooo beautifull", "I have to see this!", "it was so easy finding this, the map is so practical", "I've been there as well, but I do not believe it's the best. The one @place lux is better by my idea", "just amazing", "I will be forever gratefull you posted this!", "I'm in love with this place", "I have to agree on this one.", "Had the time of my life", "Amazing #Astrid Brian", "Breathtaking", "I've never heard of this place before, considering I live next door it felt like an epiphany", "This is nice", "f-ing nice", "That's where I proposed to my wife", "That's where I proposed to my ex-girlfriend", "Life improving!", "wowed me!", "best spot evvaaa", "so gooooood", "are you kidding me?", "Plz don't exaggerate, I thought this was a serious app", "proof that god loves us all", "Anybody would love this place", "mama mia", "almost as good as Le Wagon's demo day", "Isn't that where George lives?"].sample,
#       rating: rand(3..5),
#     )
#   end
# end


# tag seed creation to add on post and add on user

# ADD TAGS FOR EACH POST


puts "Creating posts"

# tag list for post
tags = ["fun", "culture", "sports", "hobby", "design", "art", "mind-blowing", "music", "relax", "food", "drinks", "yummy-yummy", "with-a-view", "sunday-chilling", "TGIF", "love-books", "stays forever", "starchitects", "monk beers", "crafty", "gemmy-gem!"]

tags.each do |tag|
  Tag.create!(name: tag)
end

post_list = [
  ["Lazy Jack's", "Referring to a part of a boat, Hidden in the port of Antwerp. The sweetspot for hipsters.", "permanent", "kattendijkdok-Oostkaai, 22", "Antwerp", "Belgium", "v1530605708/Lazy_Jack_s.jpg", "", "", "Culture", [Tag.find_by(name: "mind-blowing"), Tag.find_by(name: "with-a-view")]],
  ["Black Smoke", "Situated on the rooftop of 'De Koninck's' brewery. The entrance is hidden and the food and drinks are amazing.", "permanent", "Boomgaardstraat, 1", "Antwerp", "Belgium", "v1530605708/Black_Smoke.jpg", "", "", "Eat & drink"],
  ["Vischmijn", "A special way of making beers in which they need no acid. Some say they have de best draft in the world.", "permanent", "Riemstraat, 20", "Antwerp", "Belgium", "v1530605708/Vischmijn.jpg", "", "", "Eat & drink"],
  ["Nick's Café", "Just a bar you would say, Nick's Café is one of the most visited and know bars by all the locals in Antwerp.", "permanent", "Waalsekaai, 18", "Antwerp", "Belgium", "v1530605708/Nick_s_Café.jpg", "", "", "Eat & drink"],
  ["Jardim", "a pop-up bar, build out of black containers with a view on the Schelde", "permanent", "Scheldekaai, 28", "Antwerp", "Belgium", "v1530605708/Jardim.jpg", "", "", "Nightlife"],
  ["Vlaeykensgang", "A medieval alley, hedden near the town hall of Antwerp", "permanent", "Oude Koornmarkt, 16", "Antwerp", "Belgium", "v1530605708/Vlaeykensgang.jpg", "", "", "Nightlife"],
  ["Havenhuis", "Build on top of the 100-year old fire station entirely made of unequel windows. It looks like a huge rough Diamond.", "permanent", "Zaha Hadidplein, 1", "Antwerp", "Belgium", "v1530605708/Havenhuis.jpg", "","", "Culture"],
  ["Hendrik Conscience Heritage Library", "Whit a bit of luck the doors are opened in the weekend and you get the chance to have a glance at the more than 600 year-old library.", "permanent", "Hendrik Conscienceplein, 4", "Antwerp", "Belgium", "v1530605708/Hendrik_Conscience_Heritage_Library.jpg", "", "", "Culture"],
  ["The Felix Archive", "An archive that describes the history of the port of antwerp since 1505, There are some real treasures in there.", "permanent", "Oude Leeuwenrui, 29", "Antwerp", "Belgium", "v1530605708/The_Felix_Archive.jpg", "", "", "Culture"],
  ["Gustine", "Healthy organic food, prepared daily with hearth and passion", "permanent", "Rue Middelbourg, 86", "Watermael-Boitsfort", "Belgium", "v1530605707/Gustine.jpg", "", "", "Eat & drink"],
  ["Chez Josy", "At Josy’s they serve good, fresh, feminine and organic foods. This small little eatery right in the center of Watermael-Boitsfort offers quality products which make us feel good.", "permanent", "Place Eugène Keym, 15", "Watermael-Boitsfort", "Belgium", "v1530605706/CHEZ_JOSY.jpg", "", "", "Eat & drink"],
  ["Au Pays De L' Epautre", "Typical bakery, baking the bread in a argile oven with traditional recipe in the respect of the tradition", "permanent", "Avenue Pré des Agneaux, 25", "Auderghem", "Belgium", "v1530605706/Au_Pays_De_L_Epautre.jpg", "", "", "Eat & drink"],
  ["Café des Minimes", "Located between the very authentic neighborhoods of Marolles and Sablon, Café des Minimes offers a space where you can relax with friends. Local and seasonal products are showcased and drinks have been selected with special attention. Our wines are all natural while our beers are from micro-breweries. Moreover, the Café des Minimes also wants to be a cultural space where any type of event can take place.", "permanent", "Rue des Minimes, 66", "Brussels", "Belgium", "v1530605708/Cafe_des_minimes.jpg", "", "", "Eat & drink"],
  ["L'Atelier", "Small bar reserved for the true beer lovers with a large selection of trappist beer and seasonal beers, the bar looks usually close (but rarely is!) making this a place where you will meet only a few people and enjoy a timeless atmosphere.", "permanent", "Rue elise, 77", "Ixelles", "Belgium", "v1530605707/L_atelier.jpg", "", "", "Nightlife"],
  ["Poki Poké", "Poké (pronounced poh-kay) is a refreshing seafood salad originating from the islands of Hawaii. The word Poke itself is actually the Hawaiian verb for “section” or to “slice or cut”. Traditionally Poke is made from cuts of tuna or octopus, adding some flavoured rice and several different toppings. At PokiPoké, we decided to give it different forms and you will be able to eat either Poké bowls or Pokirrito", "permanent", "Chaussée d'Ixelles, 331", "Ixelles", "Belgium", "v1530605707/Poki_Poké.jpg", "","", "Eat & drink"],
  ["Bao bang bang", "Asian street food par excellence, the BAO is a tasty, white, smooth, steamed bun, of which there are many delicious variations in different countries.", "permanent", "Rue de l'Aqueduc,155", "Ixelles", "Belgium", "v1530605707/Bao_bang_bang.jpg", "", "", "Eat & drink", [Tag.find_by(name: "food")]],
  ["Johnny Velvet", "Clothing store for men and women where upcoming brands are tried out to see the respond of the market, on the verge of trendy brands and unknown brands.", "permanent", "Rue de l'Hôpital, 1", "Brussels", "Belgium", "v1530605707/Johnny_velvet.jpg", "", "", "Shop"],
  ["Caroline record shop", "Expert record shop for vinyls, where you can find everything from second hands records to the latest album released in almost every genre of music.", "permanent", "Boulevard Anspach, 101", "Brussels", "Belgium", "v1530605707/Caroline_record_shop.jpg", "", "", "Shop"],
  ["Le Perroquet", "Spacious corner bar & restaurant with art nouveau-style interior, stained glass & outdoor seating.", "permanent", "Rue Watteeu, 31", "Brussels", "Belgium", "v1530605707/Le_perroquet.jpg", "", "", "Eat & drink"],
  ["Jam Hotel Rooftop", "Rooftop bar where some summer sales are conducted once a month for local producers of clothing and accessories.", "permanent", "Chaussée de Charleroi, 132", "Brussels", "Belgium", "v1530605706/Jam_Hotel.webp", "", "", "Nightlife", [Tag.find_by(name: "mind-blowing"), Tag.find_by(name: "with-a-view")]],
  ["PLAY-LABEL Rooftop bar", "The rooftop bar is located between two of the most beautiful areas in Brussels, The Sablon and the Marolles, where you can find sets from independent artists playing in B2B.", "temporary", "Boulevard de l’Empereur, 36", "Brussels", "Belgium", "v1530605706/PLAY_LABEL_ROOFTOP_BAR.jpg", "May, 2018", "September, 2018", "Nightlife"],
  ["Casa Mundial", "beautiful place in Brussels to enjoy the world cup with your friends and colleagues. An elegant 19th-century mansion in the Botanique neighbourhood, with a mix a football game and electro set.", "temporary", "Rue Royale, 290", "Brussels", "Belgium", "v1530696516/casa-mundial-futbol-et-electro.jpg", "June, 2018", "July, 2018", "sports" ],
  ["Victor Boin Swimming pool", "Amazing swimming pool newly renovated in a Art-deco style.", "permanent", "Rue de la Perche, 38", "Brussels", "Belgium", "v1530696516/victor_boin_.jpg", "", "", "sports" ],
  ["Brasserie verschuren", "Art deco establishment with a great atmosphere located in Parvis Saint Gilles wwith an offer of local beers from micro-breweries.", "permanent", "Sint-Gillisvoorplein 11", "Brussels", "Belgium", "v1530696516/brasserie_Verschueren.jpg", "", "", "drinks"],
  ["Duden Park", "Plantations of beech trees cover the steep small valleys and share the 23 hectares of Duden Park with dense underbrush containing maple and ash, with luzula and ferns at their feet", "permanent", "Duden Park", "Brussels", "Belgium", "v1530696523/duden_parl.jpg", "", "", "hobby"]
]


post_list.each_with_index do |hey, i|
  post = Post.create!(user: User.all.sample, title: hey[0], description: hey[1], status: hey[2], street: hey[3], city: hey[4], country: hey[5], photo: hey[6], begin_date: hey[7], end_date: hey[8], category: hey[9])
   if !hey[10].nil?
     hey[10].each do |tag|
       post.tags << tag
     end
    post.save
  end
end


Post.all.each do |post|
  rand(1..15).times  do
    Review.create!(
       post: post,
      user: User.all.sample,
      description: ["I think this the best gem I ever saw, I visited it and it really change my life", "WoW, Soooo beautifull", "I have to see this!", "it was so easy finding this, the map is so practical", "I've been there as well, but I do not believe it's the best. The one @place lux is better by my idea", "just amazing", "I will be forever gratefull you posted this!", "I'm in love with this place", "I have to agree on this one.", "Had the time of my life", "Amazing #Astrid Brian", "Breathtaking", "I've never heard of this place before, considering I live next door it felt like an epiphany", "This is nice", "f-ing nice", "That's where I proposed to my wife", "That's where I proposed to my ex-girlfriend", "Life improving!", "wowed me!", "best spot evvaaa", "so gooooood", "are you kidding me?", "Plz don't exaggerate, I thought this was a serious app", "proof that god loves us all", "Anybody would love this place", "mama mia", "almost as good as Le Wagon's demo day", "Isn't that where George lives?"].sample,
      rating: rand(3..5)
    )
  end
end
# specific tag per post

# update user to User.all.sample before deploying to Heroku!!!!
# puts "Creating favorites"
# Favorite.create!(user_id: 1, post_id: 5)
# Favorite.create!(user_id: 1, post_id: 6)
# Favorite.create!(user_id: 1, post_id: 8)
# Favorite.create!(user_id: 1, post_id: 10)
# Favorite.create!(user_id: 2, post_id: 5)
# Favorite.create!(user_id: 2, post_id: 6)
# Favorite.create!(user_id: 2, post_id: 8)
# Favorite.create!(user_id: 2, post_id: 10)
# Favorite.create!(user_id: 3, post_id: 5)
# Favorite.create!(user_id: 3, post_id: 6)
# Favorite.create!(user_id: 3, post_id: 8)
# Favorite.create!(user_id: 3, post_id: 10)
# Favorite.create!(user_id: 4, post_id: 5)
# Favorite.create!(user_id: 4, post_id: 6)
# Favorite.create!(user_id: 4, post_id: 8)
# Favorite.create!(user_id: 4, post_id: 10)

