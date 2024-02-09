# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Category.create!([
  { name: "ビール" },
  { name: "サワー" },
  { name: "ハイボール" },
  { name: "焼酎" },
  { name: "日本酒" },
  { name: "ワイン" },
  { name: "その他" }
])
Character.create!([
  { animal: "panda" },
  { animal: "gorilla" },
  { animal: "crocodile" },
  { animal: "bear" }
])
Drink.create!([
  { name: "ビール", degree: 6, volume: 350, category_id: 1, predefined: true },
  { name: "サワー", degree: 6, volume: 350, category_id: 2, predefined: true },
  { name: "ハイボール", degree: 6, volume: 350, category_id: 3, predefined: true },
  { name: "焼酎", degree: 25, volume: 30, category_id: 4, predefined: true },
  { name: "日本酒", degree: 15, volume: 180, category_id: 5, predefined: true },
  { name: "ワイン", degree: 15, volume: 125, category_id: 6, predefined: true }
])