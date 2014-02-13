class UsersController < ApplicationController
  before_action :set_user

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_show_path
    end
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email,
                                 :phone)
  end
end
