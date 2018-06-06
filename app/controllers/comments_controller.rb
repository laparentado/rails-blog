class CommentsController < ApplicationController
  def index
    @comment = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = current_user.comments.new(comment_params)
    @comment.blog = @blog
    if (@comment.save)
      redirect_to "/blogs/#{params[:blog_id]}"
    else
      render "/"
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.find(params[:id])
  end


  def update
    @comment = Comment.find(params[:id])
    if(@comment.update(comment_params))
      redirect_to "/blogs/#{params[:blog_id]}"
    else
      render "/users"
    end
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @blog
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :blog_id, :user_id)
  end
end
