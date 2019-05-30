class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit, :update]
  def index

    if logged_in?
      @users = User.all
    else
      redirect_to new_user_path
    end
  end

  def show
    #@user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to @user
  end

  def edit
    #@user = User.find(params[:id])
  end

  def update
    #@user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end


  private
  def user_params
    params.require(:user).permit(:name, :username)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
