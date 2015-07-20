class UsersController < ApplicationController
  def create
    session[:email] = auth_hash.info["email"]
    redirect_to root_path
  end

  def logout
    reset_session
    redirect_to root_path
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end

end
