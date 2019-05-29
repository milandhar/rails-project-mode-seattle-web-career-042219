class Card < ApplicationRecord
  has_many :hand_cards
  has_many :hands, through: :hand_cards

  def face
    case self.value
    when "14"
      "Ace"
    when "13"
      "King"
    when "12"
      "Queen"
    when "11"
      "Jack"
    when "10"
      "Ten"
    else
      self.value.to_s
    end
  end

  def short
    "#{self.face[0]}#{self.suit[0]}"
  end

  def long
    "#{self.face} of #{self.suit}"
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
