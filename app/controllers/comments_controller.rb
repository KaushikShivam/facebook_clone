class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(content: comment_params[:content], user: current_user)
    if @comment.save
      redirect_to @post
    end
  end

  def destroy
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
  
end
