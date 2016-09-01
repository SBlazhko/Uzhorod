class SessionsController < ApplicationController

  skip_before_action :authentificate

  def new
      @user = User.new
      if @current_user != @user.id
        redirect_to posts_path
      end
  end

  def create_following
    @user = @current_user
    @follow = Follow.new
    @follow.follower_id = @user.id
    @follow.followed_id = User.find_by_id(params[:id]).id
    @follow.save
    redirect_to :back
  end

  def destroy_following
    @follow = Follow.find_by(followed_id: params[:id], follower_id: @current_user.id)
    if  @follow
        @follow.destroy
    end
      redirect_to :back
    end

  def create
    @user = User.find_by(email: login_params[:email], password: login_params[:password])
    if @user
      session[:current_user] = @user.id

      redirect_to posts_path, notice: "Hello #{@user.first_name} !"
    else
      redirect_to new_session_path, error: 'failed email or password'
    end
  end

  def destroy
    session[:current_user] = nil
    redirect_to new_session_path
  end

  private
  def login_params
    params.require(:user).permit(:email, :password)
  end
end
