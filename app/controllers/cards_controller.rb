class CardsController < ApplicationController
  #No routes needed for these
  def index
    @cards=Card.all
  end
end
