class CommentsController < ApplicationController

    def show
      @comments = Comment.all
    end

    def new
      @comment = Comment.new
    end

    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new(comment_params)
      @comment.user = @current_user
      @comment.save
      render json: @comment
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @current_user != @comment.user
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @current_user == @comment.user
    @comment.destroy
    redirect_to @post
    else
      redirect_to posts_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
