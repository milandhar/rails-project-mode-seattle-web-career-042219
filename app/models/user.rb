class User < ApplicationRecord
  has_many :rounds
  has_many :hands, through: :rounds
  attr_accessor :points

  def initialize(points=1000)
    @points = points
  end
 
end
