class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user

  private

  def authenticate_user
    client_id = ENV['GITHUB_CLIENT_ID']
    github_url = "https://github.com/login/oauth/authorize?client_id=#{client_id}&scope=repo"
    redirect_to github_url unless logged_in?
  end

 
  def logged_in?
    !!session[:token]
  end
end 

# github_url = "https://github.com/login/oauth/authorize/authenticate?client_id=#{client_id}&response_type=code&redirect_uri=#{redirect_uri}
