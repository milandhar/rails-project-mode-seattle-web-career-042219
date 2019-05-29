class RoundsController < ApplicationController

  def index
    @rounds = Round.all
  end

  def new
    @round = Round.new
  end

  def create
    @round = Round.new(round_params())
    @user = @round.user
    @d_hand = @round.deal_dealer_hand
    @p_hand = @round.deal_player_hand
    if @round.user.ante(@round.ante_amount)
      @user.save
    else
      puts 'Error, not enough points for this ante'
    end
    @round.save
  end

  def show
    @round = Round.find(params[:id])
    @user = @round.user
    @hands = #find by id, is array
    @d_hand = @hands.find #{player's = false}
  end

  def edit
    @round = Round.find(params[:id])
  end

  def update
    @round = Round.find(params[:id])
    if @round.update(round_params())
        redirect_to @round
    else
        render :edit
    end
  end

private

  def round_params()
    params.require(:round).permit!
  end
end
