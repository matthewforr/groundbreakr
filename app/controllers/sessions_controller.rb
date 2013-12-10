class SessionsController < ApplicationController
  require "uri"
  require "net/http"

  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    # TODO: Redirect to user show page
    redirect_to root_url, notice: "Signed in."
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out."
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end

  def authenticate_admin
    session[:admin_user] = user.nickname

    if admin?
      redirect_to '/'
    else
      render :text => '401 Unauthorized', :status => 401
    end
  end

  def admin
    render :text => '<a href="/auth/runkeeper">Connect with runkeeper</a>'
  end
end