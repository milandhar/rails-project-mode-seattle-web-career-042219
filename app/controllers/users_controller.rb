class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit, :update]
  def index

    if logged_in?
      @current_user = User.find(session[:user_id])
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
    @user = User.create(user_params)
    redirect_to login_path
  end

  def edit
  end

  def update
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
