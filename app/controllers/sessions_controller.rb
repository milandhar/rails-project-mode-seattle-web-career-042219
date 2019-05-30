class SessionsController < ApplicationController

  def login

  end



  def create
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:message] = "Incorrect Login"
      render :login
    end
  end
end
