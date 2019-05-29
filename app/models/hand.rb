class Hand < ApplicationRecord
  belongs_to :round
  has_many :card_hands
  has_many :cards, through: :card_hands

  def sort_by_face
    self.sort_by { |c| [c.face, c.suit] }.reverse
  end

end
