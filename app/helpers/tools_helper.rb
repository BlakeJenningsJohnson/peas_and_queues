module ToolsHelper
  def availability(tool_id, user_id=nil)
    tool = Tool.find(tool_id)
    list = Waitlist.array_of_user_ids(tool_id)
    if tool.status == 'available'
      @availability = 'Available!'
      @status = 'Rent it!'
      @action = 'rent'
    elsif tool.status == 'on hold' && user_id == tool.user_id
      @availability = 'That tool is here for you!'
      @status = 'Rent it!'
      @action = 'rent'
    elsif user_id == tool.user_id
      @availability  = "You've GOT this tool!"
      @status = 'Return it!'
      @action = 'return'
    elsif list.include? user_id
      @availability = 'queue'
      @status = "You're on the waitlist! We'll let you know when you're number on the on the queue."
    else
      @availability = 'Not Available!'
      @status = 'Get on the waitlist!'
      @action = 'waitlist'
    end
  end


end
