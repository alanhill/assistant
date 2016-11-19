class SessionsController < ApplicationController
  def create
    email = auth_hash['info']['email']
    name = auth_hash['info']['name']
    @user = User.create_with(name: name).find_or_create_by(email: email)
    session[:user_id] = @user.id
    @user.update_column(:last_login, Time.now)
    flash[:notice] = "Account for #{name} successfully created."
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
