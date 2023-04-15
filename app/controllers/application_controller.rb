class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  private

  def authenticate_user!
    unless current_user
      cookies[:back_to_page] = request.url
      redirect_to login_path, alert: "Are you a Guru? Something's wrong with email/password."
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
