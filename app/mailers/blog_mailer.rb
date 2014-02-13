class BlogMailer < ActionMailer::Base
  default from: "peasncukes@peasandqueues.com"

  def new_post_mailer(post_id, user_id)
    @post = Post.find(post_id)
    @user = User.find(user_id)
    mail(to: @user.email, 
          subject: "New Post!!!")
  end
end
