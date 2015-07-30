class UsersController < ApplicationController
  def create
    @user = User.find_by(:github_id => auth_hash.uid)
    unless @user.present?
      @user = User.create(github_hash)
    end
    session[:email] = @user.email
    redirect_to session[:redirect_url]
  end

  def logout
    reset_session
    redirect_to root_path
  end

  def login
    session[:redirect_url] = params[:redirect_uri] || root_path
    redirect_to '/auth/github'
  end

  def show
    @user = User.includes(:requests, :upvotes).friendly.find(params[:id])
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end

  def github_hash
    {
      :name => auth_hash.info["name"],
      :github_username => auth_hash.info["nickname"],
      :email => auth_hash.info["email"],
      :token => auth_hash.credentials["token"],
      :github_id => auth_hash.uid
    }
  end

end
