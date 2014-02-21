class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.create(comment_params)
    if @comment.save
      @comment.update(user_id: current_user.id)
      respond_to do |format|
        format.html { redirect_to :back }
        format.json { render json: @comment.as_json(only: :comment, include: :user) }
      end
      
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
