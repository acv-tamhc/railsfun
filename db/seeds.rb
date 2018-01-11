# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p = Product.create!(title: 'Ruby Book', description: 'Learn Ruby Programming', price: 12.99, published: true)
p = Product.create!(title: 'jQuery Book', description: 'Learn jQuery Programming', price: 11.99, published: true)
p = Product.create!(title: 'SASS Book', description: 'Learn CSS Programming', price: 19.99, published: true)