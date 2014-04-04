class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  after_filter :store_location


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :provider, :uid,  :profile) }
    devise_parameter_sanitizer.for(:sign_up ) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :provider, :uid, :profile) }
    devise_parameter_sanitizer.for(:account_update ) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :provider, :uid, :profile) }
  end

def store_location
  # store last url - this is needed for post-login redirect to whatever the user last visited.
  if (request.fullpath != "<%= Rails.configuration.dumb_url %>/users/login" &&
      request.fullpath != "<%= Rails.configuration.dumb_url %>/users/sign_up" &&
      request.fullpath != "<%= Rails.configuration.dumb_url %>/users/password" &&
      request.fullpath != "<%= Rails.configuration.dumb_url %>/logout" &&
      !request.xhr?) # don't store ajax calls
    session[:previous_url] = request.fullpath
    Rails.logger.info("store_location")
    Rails.logger.info(request.fullpath)
    Rails.logger.info("<%= Rails.configuration.dumb_url %>/users/login")
    Rails.logger.info(request.fullpath == "<%= Rails.configuration.dumb_url %>/users/login")
  end
end

def after_sign_in_path_for(resource)
  session[:previous_url] || root_path
end

def after_sign_out_path_for(resource)
  session[:previous_url] || root_path
end

  def current_user
    super
  end
  
  alias_method :devise_current_user, :current_user
  
end
