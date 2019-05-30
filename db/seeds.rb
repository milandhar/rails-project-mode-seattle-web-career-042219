# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Card.destroy_all
CARDLIST= [
  Card.create(id: 1, value: 2, suit: "Clubs", is_dealt: false),
  Card.create(id: 2, value: 3, suit: "Clubs", is_dealt: false),
  Card.create(id: 3, value: 4, suit: "Clubs", is_dealt: false),
  Card.create(id: 4, value: 5, suit: "Clubs", is_dealt: false),
  Card.create(id: 5, value: 6, suit: "Clubs", is_dealt: false),
  Card.create(id: 6, value: 7, suit: "Clubs", is_dealt: false),
  Card.create(id: 7, value: 8, suit: "Clubs", is_dealt: false),
  Card.create(id: 8, value: 9, suit: "Clubs", is_dealt: false),
  Card.create(id: 9, value: 10, suit: "Clubs", is_dealt: false),
  Card.create(id: 10, value: 11, suit: "Clubs", is_dealt: false),
  Card.create(id: 11, value: 12, suit: "Clubs", is_dealt: false),
  Card.create(id: 12, value: 13, suit: "Clubs", is_dealt: false),
  Card.create(id: 13, value: 14, suit: "Clubs", is_dealt: false),
  Card.create(id: 14, value: 2, suit: "Diamonds", is_dealt: false),
  Card.create(id: 15, value: 3, suit: "Diamonds", is_dealt: false),
  Card.create(id: 16, value: 4, suit: "Diamonds", is_dealt: false),
  Card.create(id: 17, value: 5, suit: "Diamonds", is_dealt: false),
  Card.create(id: 18, value: 6, suit: "Diamonds", is_dealt: false),
  Card.create(id: 19, value: 7, suit: "Diamonds", is_dealt: false),
  Card.create(id: 20, value: 8, suit: "Diamonds", is_dealt: false),
  Card.create(id: 21, value: 9, suit: "Diamonds", is_dealt: false),
  Card.create(id: 22, value: 10, suit: "Diamonds", is_dealt: false),
  Card.create(id: 23, value: 11, suit: "Diamonds", is_dealt: false),
  Card.create(id: 24, value: 12, suit: "Diamonds", is_dealt: false),
  Card.create(id: 25, value: 13, suit: "Diamonds", is_dealt: false),
  Card.create(id: 26, value: 14, suit: "Diamonds", is_dealt: false),
  Card.create(id: 27, value: 2, suit: "Hearts", is_dealt: false),
  Card.create(id: 28, value: 3, suit: "Hearts", is_dealt: false),
  Card.create(id: 29, value: 4, suit: "Hearts", is_dealt: false),
  Card.create(id: 30, value: 5, suit: "Hearts", is_dealt: false),
  Card.create(id: 31, value: 6, suit: "Hearts", is_dealt: false),
  Card.create(id: 32, value: 7, suit: "Hearts", is_dealt: false),
  Card.create(id: 33, value: 8, suit: "Hearts", is_dealt: false),
  Card.create(id: 34, value: 9, suit: "Hearts", is_dealt: false),
  Card.create(id: 35, value: 10, suit: "Hearts", is_dealt: false),
  Card.create(id: 36, value: 11, suit: "Hearts", is_dealt: false),
  Card.create(id: 37, value: 12, suit: "Hearts", is_dealt: false),
  Card.create(id: 38, value: 13, suit: "Hearts", is_dealt: false),
  Card.create(id: 39, value: 14, suit: "Hearts", is_dealt: false),
  Card.create(id: 40, value: 2, suit: "Spades", is_dealt: false),
  Card.create(id: 41, value: 3, suit: "Spades", is_dealt: false),
  Card.create(id: 42, value: 4, suit: "Spades", is_dealt: false),
  Card.create(id: 43, value: 5, suit: "Spades", is_dealt: false),
  Card.create(id: 44, value: 6, suit: "Spades", is_dealt: false),
  Card.create(id: 45, value: 7, suit: "Spades", is_dealt: false),
  Card.create(id: 46, value: 8, suit: "Spades", is_dealt: false),
  Card.create(id: 47, value: 9, suit: "Spades", is_dealt: false),
  Card.create(id: 48, value: 10, suit: "Spades", is_dealt: false),
  Card.create(id: 49, value: 11, suit: "Spades", is_dealt: false),
  Card.create(id: 50, value: 12, suit: "Spades", is_dealt: false),
  Card.create(id: 51, value: 13, suit: "Spades", is_dealt: false),
  Card.create(id: 52, value: 14, suit: "Spades", is_dealt: false),

]
testuser = User.find_or_create_by(id: 1, name:"Alex", username: "test", points: 1000)
testround = Round.find_or_create_by(id: 1, user_id: 1, ante_amount: 5, status: "active")
testuserhand = Hand.find_or_create_by(id: 2, round_id: 1, is_player_hand: true)
testdealerhand = Hand.find_or_create_by(id: 3, round_id: 1, is_player_hand: false)
