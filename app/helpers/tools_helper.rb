module ToolsHelper
  def availability(tool_id, user)
    tool = Tool.find(tool_id)
    list = Waitlist.array_of_user_ids(tool_id)
      if tool.status == 'available'
        @availability = 'Available!'
        @status = 'Rent it!'
        @action = 'rent'
      elsif tool.status == 'on hold' && user && user.id == tool.user_id
        @availability = 'That tool is here for you!'
        @status = 'Rent it!'
        @action = 'rent'
      elsif user && user.id == tool.user_id
        @availability  = "You've GOT this tool!"
        @status = 'Return it!'
        @action = 'return'
      elsif user && (list.include? user.id)
        @availability = 'queue'
        @status = "You're on the waitlist! We'll let you know when you're number on the on the queue."
      else
        @availability = 'Not Available!'
        @status = 'Get on the waitlist!'
        @action = 'waitlist'
      end
  end


end
