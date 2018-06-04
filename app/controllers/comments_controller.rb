class CommentsController < ApplicationController
  def index
    @comment = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    
    if comment.save
      redirect_to "/"
    else
      render "/blogs/new"
    end
  end

  def show
    @comment = Comment.find(params[:id])

  end

  def edit
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :blog_id)
  end
end
