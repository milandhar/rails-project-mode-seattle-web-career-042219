class RoundsController < ApplicationController
  def index
    @rounds = Round.all
  end

  def new
    redirect_user if logged_in? == false
    @round = Round.new
    @user = User.find(session[:user_id])
    @cards = Card.all
    # form will be needed for user_id(static), based on login, ante_amount(chosen),
    # status(always active, will be changed in edit)
  end

  def create
    @round = Round.new(round_params)
    @user = @round.user
    # attempts to decrement ante from user, fails if
    if @round.ante_amount.nil?
      flash[:errors] = 'Value of ante must be a number greater than 0'
      redirect_to new_round_path
    else
      if @round.ante_amount < 1
         flash[:errors] = 'Value of ante must be a number greater than 0'
        redirect_to new_round_path

      elsif !@user.ante(@round.ante_amount)
        flash[:errors] = '
        Sorry, enough points for this ante!
        You need triple the ante amount
        (so you have enough to bet)'
        redirect_to new_round_path
      else
        @user.save
        @round.save
        @d_hand = @round.deal_dealer_hand
        @p_hand = @round.deal_player_hand
        @round.hands << @d_hand
        @round.hands << @d_hand
        redirect_to edit_round_path(@round)
      end
      end
  end

  def edit
    @round = Round.find(params[:id])
    @user = @round.user
    @hands = @round.hands.to_a
    @d_hand = @hands.find { |h| h.is_player_hand == false }
    @p_hand = @hands.find { |h| h.is_player_hand == true }
    @d_cards = @d_hand.cards
    @p_cards = @p_hand.sort_by_face
  end

  def update
    @round = Round.find(params[:id])
    @user = @round.user
    @hands = @round.hands.to_a
    @d_hand = @hands.find { |h| h.is_player_hand == false }
    @p_hand = @hands.find { |h| h.is_player_hand == true }
    @payout = @round.bet * @p_hand.payout_multiplier
    if @round.update(round_params)
      # byebug
      if @round.status == 'fold'
        # fold things
      elsif @round.status == 'bet'
        # determime win/lose, pay out, change status to win/lose
        if !@d_hand.dealer_qualify?
          # WIN ANTE, NO BET
          @user.points += @round.bet
          @round.status = 'win'
        elsif @round.player_win?(@p_hand, @d_hand)
          # ante win/refund
          @user.points += @round.bet
          # dynamic win for different hands
          @user.points += @payout
          @round.status = 'win'
        else # LOSE
          @user.points -= @round.bet
          @round.status = 'lose'
        end
        @user.save
        @round.save
      else
        render :edit
      end
      redirect_to @round
    else
      # error here
      render :edit
    end
  end

  def show
    @round = Round.find(params[:id])
    @user = @round.user
    @hands = @round.hands.to_a
    @d_hand = @hands.find { |h| h.is_player_hand == false }
    @p_hand = @hands.find { |h| h.is_player_hand == true }
    @d_cards = @d_hand.sort_by_face
    @p_cards = @p_hand.sort_by_face
    @payout = @round.bet * @p_hand.payout_multiplier
    # @hands = #find by id, is array
    # @d_hand = #@hands.find {player's = false}
  end

  private

  def round_params
    params.require(:round).permit(:user_id, :ante_amount, :status)
  end
end
