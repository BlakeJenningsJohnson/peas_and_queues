class Tool < ActiveRecord::Base
  validates :name, presence: true
  has_many :waitlists
  has_many :users, through: :waitlists

  def rent
    if self.waitlists.count != 0
      Waitlist.remove_user_from_waitlist(id)
    end
  end

  def return
    if self.waitlists.count != 0
      Waitlist.update_waitlist(self.id)
    else
      self.update(status: 'available', user_id: nil)
    end
  end

  def self.rent_return_queue(tool_id,user_id,action)
    tool = Tool.find(tool_id)
    if action == 'rent'
      tool.rent
      tool.update(status: 'checked out', user_id: user_id)
    elsif action == 'return'
      tool.return
    elsif action == 'waitlist'
      Waitlist.create({ user_id: user_id, tool_id: tool_id } )
    end
  end

end


 # def availability(tool_id, user_id=nil)
 #    tool = Tool.find(tool_id)
 #    list = Waitlist.array_of_user_ids(tool_id)

 #    elsif user_id == tool.user_id
 #      @availability  = "You've GOT this tool!"
 #      @status = 'Return it!'
 #      @action = 'return'
 #    elsif list.include? user_id
 #      @availability = 'queue'
 #      @status = "You're on the waitlist! We'll let you know when you're number on the on the queue."
 #    else
 #      @availability = 'Not Available!'
 #      @status = 'Get on the waitlist!'
 #      @action = 'waitlist'
 #    end
 #  end