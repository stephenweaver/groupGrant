class RegistrationsController < Devise::RegistrationsController
  before_filter :user_params, only: [:create, :edit]
  before_filter :authenticate_user!, only: :edit

  def create
    # Deleting the user_type from the params hash, won't work without this.
    params[:user].delete(:user_type)
    build_resource(sign_up_params)

    # crate a new child instance depending on the given user user_type  
    child_class = @user_type.camelize.constantize
    resource.rolable = child_class.create(user_params)

    # first check if child instance is valid
    # cause if so and the parent instance is valid as well
    # it's all being saved at once
    valid = resource.valid?
    valid = resource.rolable.valid? && valid
    # customized code end

    if resource.save
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
      clean_up_passwords resource
      respond_to do |format|
        format.html { render :text => resource.errors.messages}
      end
    end
  end


   def update
    # Deleting the user_type from the params hash, won't work without this.
    current_user.user.update(params[:user].permit(:email, :password, :password_confirmation, :remember_me, :provider, :uid, :profile))
    current_user.update(user_params)
    if  current_user.user.valid? && current_user.valid?
        current_user.user.save!
        current_user.save!
        set_flash_message :notice, "Your user acount has been updated"
        respond_with resource, :location => after_sign_up_path_for(resource.user)
    else
      set_flash_message :error, "Your account could not be updated"
      respond_to do |format|
        format.html { render :text => current_user.errors.messages}
      end
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

    begin
      if !params[:user].nil? && !current_user.nil? 
        case @user_type
          when "charity"
            params[:Charity].permit(:name, :eid, :description)
          when "business"
             params[:Business].permit(:name, :goods, :description, :services)
          when "donor"
             params[:Donor].permit(:title, :first_name, :last_name, :middle_initial)
        end
      elsif !params[:user].nil?
        case @user_type
          when "charity"
            params.require(:charity).permit(:name, :eid, :description)
          when "business"
            params.require(:business).permit(:name, :goods, :description, :services)
          when "donor"
             params.require(:donor).permit(:title, :first_name, :last_name, :middle_initial)
        end
      elsif !current_user.nil?
        @user_type = current_user.user.rolable_type.underscore
      else
        @user_type = ""
      end
    rescue
      @user_type = ""
    end
  end
end