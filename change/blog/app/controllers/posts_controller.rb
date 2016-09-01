require 'factory_girl_rails'
class PostsController < ApplicationController

  skip_before_filter :authentificate

  def index
    @posts = Post.all
  end

  # # def liked_posts
  # #   @posts = []
  # #     @current_user.follower_id.each do |user_following|
  # #       User.find(follower_id.user_id).posts.each do |p|
  # #         @posts « p
  # #       end
  # #     end
  # # end

  #   else
  #     redirect_to new_session_path
  #   end
  # end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    if !@current_user
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @current_user == @post.user
      @post.update(post_params)
      redirect_to post_path
    else
      redirect_to posts_path
    end
  end

  def new
    @post = Post.new
    if !@current_user
      redirect_to posts_path
    end
  end

  def create
    @post = Post.create(post_params)
    @post.user = @current_user
    @post.save
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    if @current_user == @post.user
    @post.destroy
    redirect_to posts_path
    else
    redirect_to session_path
  end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

end
