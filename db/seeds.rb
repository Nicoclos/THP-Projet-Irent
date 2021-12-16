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