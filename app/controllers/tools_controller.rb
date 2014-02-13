class ToolsController < ApplicationController

  def new
    if current_user.try(:admin) != true
      redirect_to root_url, notice: "You have to be an admin to do that."
    else
      @tool = Tool.new
    end
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

  def rent_or_return
    @tool = Tool.find(params[:id])
    if @tool.available == false
      @tool.available = true
      @tool.user_id = nil
      flash[:notice] = "Thank you for returning your tool."
    else
      @tool.available = false
      @tool.user_id = current_user.id
      flash[:notice] = "You have rented a #{@tool.name}. Don't forget to return it!"
    end
    @tool.save
    redirect_to all_tools_path
  end

private

  def tool_params
    params.require(:tool).permit(:name, :description, :image, :user_id, :available)
  end
end
