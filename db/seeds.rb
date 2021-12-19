# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
    Building.create(nombre: Faker::Address.community, direccion: Faker::Address.street_address, ciudad: Faker::Address.city_prefix , region: Faker::Address.state)
end
puts "💾 Luis... Datos Actualizados!"