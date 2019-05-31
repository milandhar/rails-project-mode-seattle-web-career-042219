class SessionsController < ApplicationController

  def login
    byebug
  end

  def logout
    if session[:user_id] != nil
      @user = User.find(session[:user_id])
      session[:user_id] = nil
    end
  end



  def create
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now.alert = "Incorrect Login!"
      render :login
    end
  end
end
