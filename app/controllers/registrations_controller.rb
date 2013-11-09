class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  before_filter :user_params, only: [:create, :edit, :update]
  before_filter :authenticate_user!, only: :edit

  def create
    # Deleting the user_type from the params hash, won't work without this.
    Rails.logger.info("@user_type")
    Rails.logger.info(@user_type)
    params[:user].delete(:user_type)
    build_resource(sign_up_params)

    # crate a new child instance depending on the given user user_type  
    child_class = @user_type.camelize.constantize

    resource.rolable = child_class.create(params[@user_type])

    # first check if child instance is valid
    # cause if so and the parent instance is valid as well
    # it's all being saved at once
    valid = resource.valid?
    valid = resource.rolable.valid? && valid
    valid = resource.rolable.valid?
    # customized code end
    if resource.save && resource.rolable.save
      Rails.logger.info("Sucess")
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)

        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      Rails.logger.info("FAILED")
      clean_up_passwords resource
      respond_to do |format|
        format.html { render :text => resource.errors.messages}
      end
    end
  end


   def update
    self.resource = @user_type.camelize.constantize.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    if current_user.user.update_with_password(params[:user][:user]) && resource.update_attributes(user_params)
      if is_navigational_format?
        flash_key = update_needs_confirmation?(resource.user, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource.user, :bypass => true
      respond_with resource
    else
      if params[:user][:user][:current_password] == nil
        set_flash_message :error, 'update_failed'
      end
      respond_with resource
    end
  #   # Deleting the user_type from the params hash, won't work without this.

  #   current_user.user.update_attributes(params[:user][:user].permit(:email, :password, :password_confirmation, :remember_me, :provider, :uid, :profile))
  #   current_user.update_attributes(params[@user_type])
  #   if  current_user.user.valid? && current_user.valid?
  #       current_user.user.save!
  #       current_user.save!
  #       set_flash_message :notice, "Your user acount has been updated"
  #       respond_with resource, :location => after_sign_up_path_for(resource.user)
  #   else
  #     raise
  #     set_flash_message :error, "Your account could not be updated"
  #     respond_to do |format|
  #       format.html { render :text => current_user.errors.messages}
  #     end
  #   end
  end



  protected 

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:email, :password, :password_confirmation)
      end
      devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(:email, :password, :password_confirmation)
      end
    end

  private

    def user_params
      if params[:user].nil? && !@current_user.nil?
        if !@current_user.rolable_type.nil?
          @user_type = @current_user.rolable_type.downcase
        else 
          @user_type = "donor"
        end
      elsif !params[:user].nil? && @current_user.nil?
        @user_type = params[:user][:user_type]
      elsif !params[:user].nil? && !current_user.nil?
        @user_type = current_user.user.rolable_type.underscore
      else
        render root_path
      end


      if !params[:user].nil? && !current_user.nil? 
        params[:user][:user] = params[:user][:user].permit(:email, :password, :password_confirmation, :current_password, :remember_me, :provider, :uid, :profile)
        case @user_type
          when "charity"
            params[:Charity].permit(:name, :eid, :description, :video_url, :video_url_html, :mission_statement, :cover_photo, :target_area, :category_id)
          when "business"
             params[:Business].permit(:name, :goods, :description, :services)
          when "donor"
             params[:Donor] = params[:Donor].permit(:title, :first_name, :last_name, :middle_initial)
        end
      elsif !params[:user].nil?
        case @user_type
          when "charity"
            params[:charity] = params[:charity].permit(:name, :eid, :description, :video_url, :video_url_html, :mission_statement, :cover_photo, :target_area, :category_id)
          when "business"
            params[:business]= params[:business].permit(:name, :goods, :description, :services)
          when "donor"
            params[:donor] = params[:donor].permit(:title, :first_name, :last_name, :middle_initial)
        end
      elsif !current_user.nil?
        @user_type = current_user.user.rolable_type.underscore
      else
        @user_type = "nbgvfd"
      end
    end

end



