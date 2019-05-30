class ApplicationController < ActionController::Base
  helper_method :logged_in?,:redirect_user

  def redirect_user
      redirect_to login_path if !logged_in?
  end

  def logged_in?
    session[:user_id] != nil ? true : false
  end
end
