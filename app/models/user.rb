class User < ApplicationRecord
  has_many :rounds
  has_many :hands, through: :rounds
  validates :name, :username, presence: true
  validates :username, uniqueness: true

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

  def bet(round)
    self.points -= round.ante_amount
  end


  ## The following Analytics methods will be filled in once the round logic is complete
  def win_streak
    i = 0
    byebug
    reverse_rounds = self.rounds.reverse
    while i < reverse_rounds.count
      if (reverse_rounds[i].status == "win")
        i += 1
      else
        break
      end
    end
    i
  end

  def fold_percentage
    folded_rounds = self.rounds.where(status: "fold").count.to_f
    fold_percent = ((folded_rounds / self.rounds.count)*100).round(1)
    "#{fold_percent}%"
  end

  def win_percentage
    won_rounds = self.rounds.where(status: "win").count.to_f
    win_percent = ((won_rounds / self.rounds.count)*100).round(1)
    "#{win_percent}%"
  end

  def lose_percentage
    lost_rounds = self.rounds.where(status: "lose").count.to_f
    lose_percent = ((lost_rounds / self.rounds.count)*100).round(1)
    "#{lose_percent}%"
  end

end
