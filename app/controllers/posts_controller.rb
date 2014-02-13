class PostsController < ApplicationController
  before_action :set_post, only: [:show, :add_new_comment]

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
      blog_blast
      redirect_to all_posts_path, notice: "Successfully added post."
    else
      render :new
    end
  end

  def show
    @comment = @post.comments.new
  end

  def index
    @posts = Post.all
  end
  
  def blog_blast
    User.all.each do |user|
      Resque.enqueue(EmailJob, @post.id, user.id)
    end
  end
  
private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

end