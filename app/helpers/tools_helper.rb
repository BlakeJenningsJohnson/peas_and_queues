module ToolsHelper
  def availability(tool, user)
  list = Waitlist.array_of_user_ids(tool.id)
    if tool.status == 'available'
      # @tool_response = [@availability,@status,@action]
      @tool_response = ['Available!', 'Rent it!', 'rent' ]
    elsif tool.status == 'on hold' && user && user.id == tool.user_id
      @tool_response = ['That tool is here for you!', 'Rent it!', 'rent']
    elsif user && user.id == tool.user_id
      @tool_response  = ["You've GOT this tool!", 'Return it!', 'return']
    elsif user && (list.include? user.id)
      @tool_response = ['Not Available', "queue"]
    else
      @tool_response = ['Not Available', 'Get on the waitlist', 'waitlist']
    end
  end
end
