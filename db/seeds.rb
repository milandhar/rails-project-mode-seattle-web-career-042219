# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

testuser = User.create(id: 1, name:"Alex", username: "test", points: 1000)
testround = Round.create(id: 1, ante_amount: 5, active: true)
