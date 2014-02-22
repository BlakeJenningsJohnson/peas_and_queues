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
    Resque.enqueue(ToolJob, self.user.id, self.tool_id) if user.email
  end

  def self.find_who_is_next(tool_id)
     Waitlist.where(tool_id: tool_id).order('id ASC').first
  end

  def self.array_of_user_ids(tool_id)
    Waitlist.where(tool_id: tool_id).map {|line| line.user_id }
  end

  def self.update_waitlist(tool_id)
    line_in_waitlist = find_who_is_next(tool_id)
    line_in_waitlist.tool_hold
    line_in_waitlist.update_user
    line_in_waitlist.email_user
  end

  def self.place_in_waitlist(user_id, tool_id)
    Waitlist.where(tool_id: tool_id).order('id ASC').each_with_index do |line, n|
      if line.user_id == user_id
        @index = n + 1
      end
    end
    return @index
  end

  def self.remove_user_from_waitlist(tool_id)
    line_in_waitlist = find_who_is_next(tool_id)
    line_in_waitlist.destroy!
  end
end
