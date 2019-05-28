class User < ApplicationRecord
  has_many :rounds
  has_many :hands, through: :rounds
end
