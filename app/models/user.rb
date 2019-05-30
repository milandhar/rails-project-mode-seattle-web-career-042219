class User < ApplicationRecord
  has_many :rounds
  has_many :hands, through: :rounds

  def initialize(attributes = {})
    super
    self.points = 1000
  end

  def ante(ante_amount)
    if self.points >= ante_amount * 3
      self.points -= ante_amount
    else
      false
    end
  end

end
