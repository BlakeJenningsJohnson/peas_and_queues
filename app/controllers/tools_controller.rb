class ToolsController < ApplicationController

  def new
    if current_user.try(:admin) == true
      @tool = Tool.new 
    else
      flash[:notice] = "You have to be an admin to do that."
      redirect_to root_url
    end
  end

  def index
    @tools = Tool.all.order(:name)
    # @waitlist = Waitlist.new
    @tool = Tool.new
  end
  
  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      flash[:notice] = "You have added a tool."
      redirect_to all_tools_path
    else
      flash[:notice] = "There was a problem saving this tool."
      render :new
    end
  end

  def status
    Tool.rent_return_queue(params[:tool][:tool_id],
                            current_user.id,
                            params[:tool][:action])
    respond_to do |format|
      format.html {redirect_to all_tools_path}
      format.js
    end
  end

  # def rent
  #   @tool = Tool.find(params[:id])
  #   if @tool.waitlists.count == 0
  #   # else
  #   #   Waitlist.remove_user_from_waitlist(params[:id])
  #   # end
  #   # @tool.update(status: 'checked out', user_id: current_user.id)
  #   flash[:notice] = "You have rented a #{@tool.name}. Don't forget to return it!"
  #   respond_to do |format|
  #     format.html {redirect_to all_tools_path}
  #     format.js
  #   end
  # end

  # def return
  #   @tool = Tool.find(params[:id])
  #   if @tool.waitlists.count == 0
  #     @tool.update(status: 'available', user_id: nil)
  #   else
  #     Waitlist.update_waitlist(params[:id])
  #   end
  #   flash[:notice] = "Thank you for returning your tool."
  #   respond_to do |format|
  #     format.html {redirect_to all_tools_path}
  #     format.js
  #   end
  # end

private

  def tool_params
    params.require(:tool).permit(:name, :description, :image, :user_id, :status)
  end
end
