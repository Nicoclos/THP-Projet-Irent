# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

3.times do |i|
    Item.create(
      title: Faker::Camera.brand_with_model,
      summary: Faker::Quote.robin,
      description: Faker::Lorem.paragraph(sentence_count: 4),
      price: Faker::Number.positive(from: 5.00, to: 999.00).round(2),
      available_duration: Faker::Number.positive(from: 1, to: 200),
      available_start: Faker::Date.in_date_period(year: 2022, month: 1),
      available_end: Faker::Date.in_date_period(year: 2022, month: 7),
    )
end

3.times do |i|
    Item.create(
      title: Faker::Book.title,
      summary: Faker::Quote.robin,
      description: Faker::Lorem.paragraph(sentence_count: 4),
      price: Faker::Number.positive(from: 5.00, to: 999.00).round(2),
      available_duration: Faker::Number.positive(from: 1, to: 200),
      available_start: Faker::Date.in_date_period(year: 2022, month: 2),
      available_end: Faker::Date.in_date_period(year: 2022, month: 8),
    )
end

3.times do |i|
    Item.create(
      title: Faker::Game.title,
      summary: Faker::Quote.robin,
      description: Faker::Lorem.paragraph(sentence_count: 4),
      price: Faker::Number.positive(from: 5.00, to: 999.00).round(2),
      available_duration: Faker::Number.positive(from: 1, to: 200),
      available_start: Faker::Date.in_date_period(year: 2022, month: 3),
      available_end: Faker::Date.in_date_period(year: 2022, month: 9),
    )
end
Category.create(
  title: "Mode",
)
CreateSubCategories.create(
  title: "Vêtements", category_id: 1, 
  title: "Chaussures", category_id: 1,
  title: "Accessoires & Bagagerie", category_id: 1,
  title: "Montres & Bijoux", category_id: 1,
  title: "Equipement bébé", category_id: 1,
  title: "Luxe et Tendance", category_id: 1,
)
Category.create(
  title: "Maison",
)
CreateSubCategories.create(
  title: "Ameublement",  category_id: 2,
  title: "Electroménager",  category_id: 2,
  title: "Arts de la table",  category_id: 2,
  title: "Décoration",  category_id: 2,
  title: "Bricolage",  category_id: 2,
  title: "Jardinage",  category_id: 2,
)
Category.create(
  title: "Multimédia",
)
CreateSubCategories.create(
  title: "Informatique",  category_id: 3,
  title: "Consoles & Jeux Vidéo",  category_id: 3,
  title: "Téléphonie",  category_id: 3,
  title: "Matériel audio",  category_id: 3,
  title: "Matériel video",  category_id: 3,
)
Category.create(
  title: "Loisir",
)
CreateSubCategories.create(
  title: "DVD - Films",  category_id: 4,
  title: "CD - Musique",  category_id: 4,
  title: "Livres",  category_id: 4,
  title: "Sport & Hobies",  category_id: 4,
  title: "Instruments de musique",  category_id: 4,
  title: "Collections",  category_id: 4,
  title: "Jeux & Jouets",  category_id: 4,
)
Category.create(
  title: "Sport",
)
Category.create(
  title: "Animaux",
)
CreateSubCategories.create(
  title: "Cage de Transport",  category_id: 6,  
)
Category.create(
  title: "Transport",
)
CreateSubCategories.create(
  title: "Equipement auto",  category_id: 7,
  title: "Equipement moto",  category_id: 7,
)
Category.create(
  title: "Immobilier",
)
CreateSubCategories.create(
  title: "Salle de conférence",  category_id: 8, 
)
Category.create(
  title: "Matériel Professionel",
)
CreateSubCategories.create(
  title: "Matériel agricole", category_id: 9,
  title: "Outillage", category_id: 9,
  title: "Equipement industriels", category_id: 9,
  title: "Matériel médical", category_id: 9,
)
Category.create(
  title: "Services",
)
CreateSubCategories.create(
  title: "Préstation de service", category_id: 10,   
  title: "Cours particuliers", category_id: 10,
)
puts "der seed is generate mein general !"