class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :provider, :uid,  :profile) }
    devise_parameter_sanitizer.for(:sign_up ) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :provider, :uid, :profile) }
    devise_parameter_sanitizer.for(:account_update ) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :provider, :uid, :profile) }
  end

  alias_method :devise_current_user, :current_user
  def current_user
    # It will now return either a Company or a Customer, instead of the plain User.
      begin
        return super.rolable
      rescue Exception => e
        return super
      end
  end
  
end
