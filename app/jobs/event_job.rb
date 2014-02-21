class EventJob
  extend HerokuResqueAutoscaler if Rails.env.production?

  @queue = :email 

  def self.perform(event_id, user_id)
    PeasMailer.upcoming_event(event_id, user_id).deliver
  end
end