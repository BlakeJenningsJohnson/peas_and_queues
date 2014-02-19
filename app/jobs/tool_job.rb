class ToolJob
  @queue = :email 

  def self.perform(user_id)
    PeasMailer.tool_available(user_id).deliver
  end
end