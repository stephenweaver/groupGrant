class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  before_filter :user_type, only: [:create, :update]
  before_filter :authenticate_user!, only: :edit


  def create
    child_class         = @user_type.camelize.constantize
    user_params_user    = user_params
    user_params_rolable = user_params[:rolable_attributes]
    user_params_user.delete(:rolable_attributes)

    @role_resource      = child_class.new(user_params_rolable)
    @role_resource.user = build_resource(sign_up_params)
    resource.rolable    = @role_resource
    # Deleting the user_type from the params hash, won't work without this.
    
    # create a new child instance depending on the given user user_type  
    # first check if child instance is valid
    # cause if so and the parent instance is valid as well
    # it's all being saved at once
    
    valid = resource.valid?

    # customized code end
    if valid && resource.save!
      Rails.logger.info("Success")
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)

        respond_with resource.rolable
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      Rails.logger.info("FAILED")
      clean_up_passwords resource
      # respond_to do |format|
      #   format.html { render :text => resource.errors.messages}
      # end
      respond_with resource.rolable.user
    end
  end

  def auto_login 
    type = params[:type]
    users = User.find_by_rolable_type(type).where(availability: 1)
    user.count 
    random_number = genRandomNumber(0,user.count-1)
    sign_in_and_redirect User.find(user[random_number].id)
  end

  def destroy
    #raise
    #user = resource.user.id
    if current_user == "Business"
      g = Groupgrant.where(partner_id: current_user.id)

      #g = Groupgrant.find(g)
      if g != nil 
        g = Groupgrant.find(g)
        g.partner_id = 0
        g.save
      end
    end
    User.destroy(current_user)
    respond_to do |format|
      flash[:notice] = "Thank you for using groupGrant"
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end


   def update
    # self.resource = resource.class.name.camelize.constantize.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    if user_params[:password].blank?
      user_params.delete("password")
      user_params.delete("password_confirmation")
    end

    user_params_user    = user_params
    user_params_rolable = user_params[:rolable_attributes]
    user_params_user.delete(:rolable_attributes)
    if current_user.update_without_password(user_params_user) && current_user.rolable.update_attributes(user_params_rolable)
        if is_navigational_format?
          flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
            :update_needs_confirmation : :updated
          set_flash_message :notice, flash_key
        end
        sign_in resource_name, resource, :bypass => true
        respond_with resource.rolable
    else
      # if user_temp[:current_password] == nil
      #   set_flash_message :error, 'update_failed'
      # end
      respond_with resource.rolable
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
        u.permit(:address, :email, :password, :password_confirmation, :phone, :profile, :rolable_attributes=>[])
      end
      devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(:address, :email, :password, :password_confirmation, :phone, :profile)
      end
    end

  private
    def user_type
      # For a new user
      if !params[:user].nil? && @current_user.nil?
        if(params[:user][:user_type])
          @user_type = params[:user][:user_type]
          if @user_type.nil?
            if params[:Donor]
              @user_type = "donor"
            elsif params[:Business]
              @user_type = "business"
            elsif params[:Charity]
              @user_type = "charity"
            end
          end
        end
      # For editing a user
      elsif(!current_user.nil?)
        @user_type = current_user.rolable.class.name.downcase
      end
    end

    def user_params
      user_attrs      = [:email, :password, :password_confirmation, :phone, :profile, :donor, :address]
      charity_attrs   = [:name, :eid, :description, :video_url, :video_url_html, :mission_statement, :cover_photo, :target_area, :category_id, :rolable]
      business_attrs  = [:name, :goods, :description, :services, :slogan, :rolable, :category_id, :location, :interests]
      donor_attrs     = [:title, :first_name, :last_name, :middle_initial, :rolable]

      case @user_type
        when "charity"
          params[:user] = params[:user].permit(user_attrs, rolable_attributes: charity_attrs)
        when "business"
          params[:user] = params[:user].permit(user_attrs, rolable_attributes: business_attrs)
        when "donor"
          params[:user] = params[:user].permit(user_attrs, rolable_attributes: donor_attrs)
      end
    end  
end



