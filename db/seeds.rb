# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Review.destroy_all
Post.delete_all
User.destroy_all

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
      address: ["beursplein 3, 1000 brussel", "elsensesteenweg 21, 1000 brussel", "nieuwstraat 124, 1000 brussel"].sample,
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
