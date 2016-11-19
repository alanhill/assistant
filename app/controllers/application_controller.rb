class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    redirect_to root_path, alert: 'You must be signed in to access this page'  unless current_user
  end

  def require_admin
    redirect_to root_path, alert: 'You must be an admin in order to access this page'  unless current_user && current_user.admin
  end
end
