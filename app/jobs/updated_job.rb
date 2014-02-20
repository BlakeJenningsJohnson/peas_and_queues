class UpdatedJob
  extend HerokuResqueAutoscaler if Rails.env.production?
  
  @queue = :email 

  def self.perform(user_id)
    PeasMailer.updated_profile_mailer(user_id).deliver
  end
end