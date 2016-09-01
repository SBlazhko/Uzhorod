class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_user, :authentificate, :set_locale

  private

  def set_user
    if session[:current_user]
      @current_user = User.find(session[:current_user])
    end
  end

  def authentificate
    authentificate_or_request_with_http_basic do |email, password|
      user = User.find_by(email: email)
      return false if user.blank?

      password == user.password
    # unless session[:current_user]
    #   redirect_to new_session_path
    # end
    end
  end

  def set_locale
        if params[:locale] == 'en'
          I18n.locale = 'en'
        elsif params[:locale] == 'uk'
          I18n.locale = 'uk'
        end
  end
end
