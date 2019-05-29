class Round < ApplicationRecord
  belongs_to :user
  has_many :hands

  def initialize(args)
    super
    #"Resets" the deck by making all cards available
    Card.reset_deck
  end

  def deal_dealer_hand
    Hand.create({round_id: self.id, is_player_hand: false})
  end

  def deal_player_hand
    Hand.create({round_id: self.id, is_player_hand: true})
  end



end
