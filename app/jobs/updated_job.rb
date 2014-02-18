class UpdatedJob
  @queue = :email 

  def self.perform(user_id)
    PeasMailer.updated_profile_mailer(user_id).deliver
  end
end