class User < ActiveRecord::Base
  attr_reader :points

  def initialize(points=1000)
    @points = points
  end
end
