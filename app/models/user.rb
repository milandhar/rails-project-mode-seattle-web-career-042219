class User < ApplicationRecord
  has_many :rounds
  has_many :hands, through: :rounds

  def initialize(attributes = {})
    super
    self.points = 1000
  end

  def ante(ante_amount)
    if self.points >= ante_amount
      self.points -= ante_amount
    else
      false
    end
  end

  def win_streak
    i = 0
    while i < self.rounds.all.count
      # if (self.rounds.all[i].won?)
      #   i += 1
      # else
      #   i
      # end
    end
  end

  def fold_percentage

    folded_rounds = self.rounds.all.where(fold).count
    folded_rounds / self.rounds.all.count
  end

  def win_percentage
    won_rounds = self.rounds.all.where(won).count
    won_rounds / self.rounds.all.count
  end

end
