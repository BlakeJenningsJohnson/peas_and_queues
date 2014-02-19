class WaitlistsController < ApplicationController

  def create
    @waitlist = Waitlist.new(waitlist_params)
    if @waitlist.save
      redirect_to all_tools_path
      raise
    end
  end

private

  def waitlist_params
    params.require(:waitlist).permit(:user_id, :tool_id)
  end

end