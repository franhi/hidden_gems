# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Post.destroy_all
Review.destroy_all

User.create!(email: "irma@irma.com", password: "lewagon", address: "brussels")
User.create!(email: "francois@francois.com", password: "lewagon", address: "brussels")
User.create!(email: "john@john.com", password: "lewagon", address: "brussels")
User.create!(email: "erland@erland.com", password: "lewagon", name: "Erland", address: "antwerp")

10.times  do
  status =  ["temporary", "permanent"].sample
    if :status == "temporary"

      Post.create!(
      user_id: rand(1..4),
      description: Faker::Hipster.paragraph,
      category: ["general", "entertainment", "sports", "hobby", "design", "art", "mind-blowing", "music", "relax", "food", "drinks"].sample,
      title: ["Buffalo's in brussels", "exclusive rooftop-party", "Le Wagon demo day!", "crazy dance-off", "haunted castle", "Rue D'Isabelle", "tropismes", "madame pipi", "la pasionaria", "king albert's jacket", "urban rooms", "druum", "parvis de saint-gilles", "marolles", "matongé", "le 203", "PeÏ et Meï", "Bcentral's coffee", "The mysterious teachers of Le Wagon", "Who's Ana", "het Mim", "Play-Label"].sample,
      status: status,
      address: Faker::Address.full_address,
      photo: Faker::Placeholdit.image,
      begin_date: Faker::Date.between(Date.today, 5.days.from_now),
      end_date: Faker::Date.between(5.days.from_now, 10.days.from_now),
      )
    else
      Post.create!(
      user_id: rand(1..4),
      description: Faker::Hipster.paragraph,
      category: ["general", "entertainment", "sports", "hobby", "design", "art", "mind-blowing", "music", "relax", "food", "drinks"].sample,
      title: ["Buffalo's in brussels", "exclusive rooftop-party", "Le Wagon demo day!", "crazy dance-off", "haunted castle", "Rue D'Isabelle", "tropismes", "madame pipi", "la pasionaria", "king albert's jacket", "urban rooms", "druum", "parvis de saint-gilles", "marolles", "matongé", "le 203", "PeÏ et Meï", "Bcentral's coffee", "The mysterious teachers of Le Wagon", "Who's Ana", "het Mim", "Play-Label"].sample,
      status: status,
      address: Faker::Address.full_address,
      photo: Faker::Placeholdit.image,
      )
    end
end
