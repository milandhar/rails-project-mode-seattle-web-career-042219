class ApplicationController < ActionController::Base
  helper_method :logged_in?,:redirect_user

  def redirect_user
      flash[:message] = "You Must Log In To See That Page!"
      redirect_to login_path if !logged_in?

  end

  def logged_in?
    session[:user_id] != nil ? true : false
  end
end
