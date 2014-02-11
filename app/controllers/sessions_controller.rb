class SessionsController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']

    if auth_hash["uid"]
      @user = User.find_or_create_from_omniauth(auth_hash)
      if @user
        session[:user_id] = @user.id
        redirect_to "/"
      else
        redirect_to "/", notice: "Failed to save user."
      end
    else
      redirect_to "/", notice: "Failed to authenticate. Please try again."
    end
  end
end
