class User < ApplicationRecord
  has_many :rounds
  has_many :hands, through: :rounds

  def initialize(attributes = {})
    super
    self.points = 1000
  end

end
