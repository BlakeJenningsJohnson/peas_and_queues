class ToolJob
  extend HerokuResqueAutoscaler if Rails.env.production?
  
  @queue = :email 

  def self.perform(user_id, tool_id)
    PeasMailer.tool_available(user_id, tool_id).deliver
  end
end