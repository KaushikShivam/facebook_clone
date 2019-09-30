class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(content: comment_params[:content], user: current_user)
    if @comment.save
      flash[:success] = "Comment created successfully!"
      redirect_to @post
    else
      flash[:danger] = "Comment creation failed"
      redirect_to @post
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment deleted successfully!"
    redirect_to @post
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
  
end
