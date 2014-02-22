class Tool < ActiveRecord::Base
  validates :name, presence: true
  has_many :waitlists
  has_many :users, through: :waitlists

  def rent
    if self.waitlists.count != 0
      Waitlist.remove_user_from_waitlist(id)
    end
    self.update(status: 'checked out', user_id: user_id)
  end

  def return
    if self.waitlists.count == 0
      self.update(status: 'available', user_id: nil)
    else
      Waitlist.update_waitlist(self.id)
    end
  end

  def self.rent_return_queue(tool_id,user_id,action)
    tool = Tool.find(tool_id)
    if action == 'rent'
      tool.rent
    elsif action == 'return'
      tool.return
    elsif action == 'waitlist'
      Waitlist.create({ user_id: user_id, tool_id: tool_id } )
    end
  end

end
