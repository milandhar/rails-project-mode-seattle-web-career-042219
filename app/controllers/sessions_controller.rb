class SessionsController < ApplicationController

  def login

  end

  def logout
    @user = User.find(session[:user_id])
    session[:user_id] = nil
  end



  def create
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:message] = "Incorrect Login"
      render :login
    end
  end
end
