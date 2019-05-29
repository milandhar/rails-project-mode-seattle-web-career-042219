# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Round.destroy_all
Card.destroy_all

testuser = User.create(id: 1, name:"Alex", username: "test", points: 1000)
testround = Round.create(id: 1, ante_amount: 5, active: true)


card1 = Card.create(suit: "hearts", value: "5", is_dealt: true)
card2 = Card.create(suit: "spades", value: "11", is_dealt: true)
card3 = Card.create(suit: "diamonds", value: "11", is_dealt: true)
card4 = Card.create(suit: "clubs", value: "5", is_dealt: true)
card5 = Card.create(suit: "hearts", value: "10", is_dealt: true)

card6 = Card.create(suit: "spades", value: "8", is_dealt: true)
card7 = Card.create(suit: "diamonds", value: "9", is_dealt: true)
card8 = Card.create(suit: "diamonds", value: "10", is_dealt: true)
card9 = Card.create(suit: "clubs", value: "11", is_dealt: true)
card10 = Card.create(suit: "hearts", value: "12", is_dealt: true)

test_user_hand = Card.all[1..5]
test_dealer_hand = Card.all[6..10]
