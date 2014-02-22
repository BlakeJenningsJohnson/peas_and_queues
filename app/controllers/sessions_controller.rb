class SessionsController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']

    if auth_hash["uid"]
      @user = User.find_or_create_from_omniauth(auth_hash)
      
      if @user
        session[:user_id] = @user.id
        flash[:notice] = "Welcome to Peas-n-Queues!"
        redirect_to "/"
      end
    else
      redirect_to "/", notice: "Failed to authenticate. Please try again."
    end
  rescue OAuth::Unauthorized
     redirect_to "/", notice: "Failed to save user."
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have signed out."
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to root_path
  end
end
