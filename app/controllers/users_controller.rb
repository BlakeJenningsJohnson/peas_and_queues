class UsersController < ApplicationController
  before_action :set_user

  def edit
  end

  def update
    puts params.inspect
    if @user.update(user_params)
      Resque.enqueue(UpdatedJob, @user.id)
    end
    respond_to do |format|
      format.json { head :no_content }
    end
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :phone)
  end
end
