class Round < ApplicationRecord
  belongs_to :user
  has_many :hands
end
