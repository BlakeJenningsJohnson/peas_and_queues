class UsersController < ApplicationController
  before_action :set_user

  def edit
  end

  def update
    if @user.update(user_params)
      Resque.enqueue(UpdatedJob, @user.id) if @user.email
      respond_to do |format|
        format.json { head :no_content }
        format.html { redirect_to root_url }
      end
    else
      render :edit
    end
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone)
  end
end
