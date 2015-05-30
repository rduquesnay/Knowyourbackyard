class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_notifications
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username,:email,:password,:password_confimation,:firstname,:lastname,:country,:city,:province,:about)}
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login,:username,:email,:password,:remember_me)}
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password,:firstname,:lastname,:country,:city,:province,:about) }
  end
  def ensure_admin!
    authenticate_user!
    unless current_user.admin?
      sign_out current_user
      redirect_to new_user_session_path
      return false
    end
  end
  def ensure_trailblazer!
    authenticate_user!
    unless current_user.trailblazer?
      sign_out current_user
      redirect_to new_user_session_path
      return false
    end
  end

  private
   def set_notifications
     @notes = []
     @notes = Notification.where(user_id: current_user.id) unless current_user.nil?
   end
end
