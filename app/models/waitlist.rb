class Waitlist < ActiveRecord::Base
  belongs_to :user
  belongs_to :tool

  def tool_hold
  end

  def self.find_who_is_next(tool_id)
     Waitlist.where(tool_id: tool_id).order('id ASC').first
  end

  def self.update_waitlist(tool_id)
  end
end
