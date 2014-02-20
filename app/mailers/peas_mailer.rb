class PeasMailer < ActionMailer::Base
  default from: "psnqs@peasandqueues.com"

  def new_post_mailer(post_id, user_id)
    @post = Post.find(post_id)
    @user = User.find(user_id)
    mail(to: @user.email, 
          subject: "New Post!!!")
  end

  def updated_profile_mailer(user_id)
    @user = User.find(user_id)
    mail(to: @user.email,
          subject: 'Updated Profile')
  end

  def tool_available(user_id, tool_id)
    @user = User.find(user_id)
    @tool = Tool.find(tool_id)
    mail(to: @user.email,
          subject: 'Your Tool Is Available!')
  end
end
