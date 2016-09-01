  class RegistrationsController < ApplicationController

  skip_before_action :authentificate

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def show
    if @current_user
    @user = User.find_by(params[:id])
    else
      redirect_to users_path, notice: "Спочатку залогінься"
    end
  end

  def create
    @user = User.new(registrations_params)
    if @user.save
      Usermailer.welcome_email(@user).deliver_now
      redirect_to posts_path, notice: t('accounts.uscre')
    else
      render :new
    end
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user
    if @user.update(registrations_params)
      render json: {text: t('ajax.update')}
      # redirect_to posts_path, notice: t('accounts.acup')
    end
  end

  def stats
    user = User.find_by_id(params[:user_id])
      if user
        render text: user.stats, status: 200
      else
        render text: "OSHibka", status: 404
     end
  end

 def chekcemail
    user = User.find(params[:id])
    if user
      render text: user.email
    else
      render text: "nil user"
    end
  end

  private
  def registrations_params
    params.require(:user).permit(:first_name, :last_name, :gender, :email, :password, :country, :city)
  end
end
