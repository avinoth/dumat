class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find_by_email(session[:email])
  end

  def user_logged_in?
    session[:email].present?
  end

  def require_login
    unless session[:email]
      redirect_to root_path
    end
  end
end
