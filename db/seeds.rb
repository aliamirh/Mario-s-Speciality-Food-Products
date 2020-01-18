# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all

10.times do
  Product.create!(name: Faker::DcComics.title,
    cost: Faker::Number.between(from: 1, to: 800),
    country_of_origin: Faker::Address.country_code_long)
end
