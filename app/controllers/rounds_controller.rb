class RoundsController < ApplicationController

  def index
    @rounds = Round.all
  end

  def new
    @round = Round.new
    @cards = Card.all
    # form will be needed for user_id(static), based on login, ante_amount(chosen),
    # status(always active, will be changed in edit)

  end

  def create
    @round = Round.new(round_params())
    @user = @round.user
    #attempts to decrement ante from user, fails if
    if @user.ante(@round.ante_amount)
      @user.save
    else
      #Flash error this?
      'Error, not enough points for this ante'
      #Re-render new page?
    end
    @round.save
    @d_hand = @round.deal_dealer_hand
    @p_hand = @round.deal_player_hand
    @round.hands << @d_hand
    @round.hands << @d_hand

    redirect_to edit_round_path(@round)
  end

  def edit
    @round = Round.find(params[:id])
    @user = @round.user
    @hands = @round.hands.to_a
    @d_hand = @hands.find{|h| h.is_player_hand == false}
    @p_hand = @hands.find{|h| h.is_player_hand == true}
    @d_cards = @d_hand.cards
    @p_cards = @p_hand.sort_by_face

    # update status to fold/"bet"
    #
  end

  def update
    @round = Round.find(params[:id])
    if @round.status == "fold"
    end


    #win/lose logic needs to be enacted in here if status = 'bet'
    if @round.update(round_params())
        redirect_to @round
    else
        render :edit
    end
  end

  def show
    @round = Round.find(params[:id])
    @user = @round.user
    # @hands = #find by id, is array
    # @d_hand = #@hands.find {player's = false}
  end


private

  def round_params()
    params.require(:round).permit(:user_id, :ante_amount, :status)
  end
end
