# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
["ビール", "サワー", "ハイボール", "焼酎", "日本酒", "ワイン", "その他"].each do |name|
    Category.find_or_create_by(name: name)
  end
  
Character.create!([
  { animal: "panda" },
  { animal: "gorilla" },
  { animal: "crocodile" },
  { animal: "bear" }
])
drinks = [
  { name: "ビール", degree: 6, volume: 350, category_id: 1, predefined: true },
  { name: "サワー", degree: 6, volume: 350, category_id: 2, predefined: true },
  { name: "ハイボール", degree: 6, volume: 350, category_id: 3, predefined: true },
  { name: "焼酎", degree: 25, volume: 30, category_id: 4, predefined: true },
  { name: "日本酒", degree: 15, volume: 180, category_id: 5, predefined: true },
  { name: "ワイン", degree: 15, volume: 125, category_id: 6, predefined: true }
]

drinks.each do |drink_attributes|
  Drink.find_or_create_by!(name: drink_attributes[:name]) do |drink|
    drink.degree = drink_attributes[:degree]
    drink.volume = drink_attributes[:volume]
    drink.category_id = drink_attributes[:category_id]
    drink.predefined = drink_attributes[:predefined]
  end
end
panda = Character.find_by(animal: "panda")
if panda
  RandomSpeech.create!(
    character_id: panda.id,
    alcohol_speeches: "お酒が一番！",
    random_speeches: "お酒を飲もうよ！"
  )
end
gorilla = Character.find_by(animal: "gorilla")
if gorilla
  RandomSpeech.create!(
    character_id: gorilla.id,
    alcohol_speeches: "お酒が一番！",
    random_speeches: "お酒を飲もうよ！"
  )
end
crocodile = Character.find_by(animal: "crocodile")
if crocodile
  RandomSpeech.create!(
    character_id: crocodile.id,
    alcohol_speeches: "お酒が一番！",
    random_speeches: "お酒を飲もうよ！"
  )
end
bear = Character.find_by(animal: "bear")
if bear
  RandomSpeech.create!(
    character_id: bear.id,
    alcohol_speeches: "お酒が一番！",
    random_speeches: "お酒を飲もうよ！"
  )
end
if User.find_by(email: 'admin@example.com').nil?
  User.create!(
    username: 'admin',
    email: 'admin@example.com',
    password: 'securepassword',
    password_confirmation: 'securepassword',
    admin: true,
    weight: 60  
  )
end