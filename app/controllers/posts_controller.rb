class PostsController < ApplicationController

  def new
    if current_user.admin != true
      redirect_to root_url, notice: "You have to be an admin to do that."
    else
      @post = Post.new
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = @current_user.id
    if current_user.admin? && @post.save
      #this is where the action_mailer goes
      redirect_to posts_path, notice: "Successfully added post."
    else
      render :new
    end
  end


private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end