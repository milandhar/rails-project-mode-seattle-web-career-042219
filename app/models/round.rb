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

  def bet
    self.ante_amount * 2
  end

  def player_win?(player_hand, dealer_hand)
    p = player_hand.score
    d = dealer_hand.score
    i = 0
    while i < 7
      if p[i] > d[i]
        return true
      elsif p[i] < d[i]
        return false
      else
        i += 1
      end
    end
  end


end
