module ApplicationHelper
  def current_user
    User.find_by_email(session[:email])
  end

  def user_logged_in?
    session[:email].present?
  end

end
