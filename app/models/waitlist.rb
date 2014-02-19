class Waitlist < ActiveRecord::Base
  belongs_to :user
  belongs_to :tool

  def tool_hold
    self.tool.update(status: 'on hold')
  end

  def update_user
    self.tool.update(user_id: self.user.id)
  end

  def email_user
    Resque.enqueue(ToolJob, self.user.id)
  end

  def self.find_who_is_next(tool_id)
     Waitlist.where(tool_id: tool_id).order('id ASC').first
  end

  def self.update_waitlist(tool_id)
    find_who_is_next
    tool_hold
    update_user
  end
end
