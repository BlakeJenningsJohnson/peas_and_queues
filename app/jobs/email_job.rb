class EmailJob
  @queue = :email 

  def self.perform(post_id, user)
    puts "This is a job"
  end
end