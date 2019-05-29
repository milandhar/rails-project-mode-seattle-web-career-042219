class Round < ApplicationRecord
  belongs_to :user
  has_many :hands

  def initialize(args)
    #"Resets" the deck by making all cards available
    Card.reset_deck
  end

  # def deal_hands
  #   Card.all.sample(10)
  #
  # end
end
