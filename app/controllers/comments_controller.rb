class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.create(comment_params)
    if @comment.save
      @comment.update(user_id: current_user.id)
      redirect_to :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
