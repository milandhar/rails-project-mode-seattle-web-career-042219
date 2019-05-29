class Card < ApplicationRecord
  has_many :card_hands
  has_many :hands, through: :card_hands

  def display_face
    case self.value
    when "14"
      "A"
    when "13"
      "K"
    when "12"
      "Q"
    when "11"
      "J"
    else
      self.value.to_s
    end
  end

  def self.deal(n=1)
    available_cards = Card.where("is_dealt = false")
    hand = available_cards.sample(n)
    hand.each do |c|
      c.is_dealt = true
      c.save
    end
  end

  def self.reset_deck
    Card.update_all(is_dealt: false)
  end
end
