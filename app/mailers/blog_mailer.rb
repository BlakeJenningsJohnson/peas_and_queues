class BlogMailer < ActionMailer::Base
  default from: "peasncukes@peasandqueues.com"

  def new_post_mailer(post_id, user)
    @post = Post.find(post_id)
    mail(to: "davida.marion@gmail.com", #user
          subject: "New Post!!!")
  end
end
