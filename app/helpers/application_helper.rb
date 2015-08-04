module ApplicationHelper
  def current_user
    User.find_by_email(session[:email])
  end

  def user_logged_in?
    session[:email].present?
  end

  def is_owner? req
    if user_logged_in?
      req.user == current_user
    end
  end
end
