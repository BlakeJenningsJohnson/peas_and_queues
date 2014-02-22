module ToolsHelper
  def availability(tool_id, user_id=nil)
    tool = Tool.find(tool_id)
    if tool.status == 'available'
      @response = 'Available!'
    elsif tool.status == 'on hold' && user_id == tool.user_id
      @reponse = 'That tool is here for you!'
    elsif user_id == tool.user_id
      @response  = "You've GOT this tool!"
    else
      @response = 'Not Available!'
    end
  end

end
