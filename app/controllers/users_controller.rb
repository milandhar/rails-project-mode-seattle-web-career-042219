class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit, :update]
  def index

    if logged_in?
      @users = User.all
      @ordered_users = @users.sort_by{|user| user.username}
    else
      redirect_user
    end
  end

  def show
    if logged_in? == false
      redirect_user
    end
    #@user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now.alert = "Profile Created Sucessfully"

      redirect_to @user
    else
      flash.now.alert = "Please Select a Different Username"
      render :new
    end
  end

  def edit
  end

  def update

    if @user.update(user_params)
      flash.now.alert = "Profile Created Sucessfully"
      redirect_to @user
    else
      flash.now.alert = "Please Select a Different Username"
      render :edit
    end

  end


  private
  def user_params
    params.require(:user).permit(:name, :username, :points)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
