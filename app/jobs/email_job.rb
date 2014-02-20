class EmailJob
  extend HerokuResqueAutoscaler if Rails.env.production?

  @queue = :email 

  def self.perform(post_id, user_id)
    PeasMailer.new_post_mailer(post_id, user_id).deliver
  end
end