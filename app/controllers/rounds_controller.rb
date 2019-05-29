class RoundsController < ApplicationController

  def index
    @rounds = Round.all
  end

  def new
    @round = Round.new
  end

  def create
    @round = Round.new(round_params())
    if @round.save
        redirect_to @round
    else
        render :new
    end
  end

  def show
    @round = Round.find(params[:id])
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
    params.require(:round).permit(:first_name, :last_name)
  end
end
