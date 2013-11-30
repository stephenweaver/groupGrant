class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  before_filter :user_type, only: [:create, :update]
  before_filter :authenticate_user!, only: :edit

  def create
    child_class = @user_type.camelize.constantize
    params[:user].delete(:user_type)
    @role_resource = child_class.new(user_params)
    @role_resource.user = build_resource(sign_up_params)
    resource.rolable = @role_resource
    # Deleting the user_type from the params hash, won't work without this.
    
    # crate a new child instance depending on the given user user_type  
    # first check if child instance is valid
    # cause if so and the parent instance is valid as well
    # it's all being saved at once
    
    valid = resource.rolable.user.valid?
    valid = resource.rolable.valid? && valid

    # customized code end
    if valid && resource.save! && resource.rolable.save!
      Rails.logger.info("Success")
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
      # respond_to do |format|
      #   format.html { render :text => resource.errors.messages}
      # end
      respond_with resource.rolable.user
    end
  end


   def update
    self.resource = @user_type.camelize.constantize.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    if user_params[:user][:password].blank?
      user_params[:user].delete("password")
      user_params[:user].delete("password_confirmation")
    end

    user_temp = user_params[:user]
    user_params.delete(:user)
    if current_user.user.update_without_password(user_temp) && resource.update_attributes(user_params)
        if is_navigational_format?
          flash_key = update_needs_confirmation?(resource.user, prev_unconfirmed_email) ?
            :update_needs_confirmation : :updated
          set_flash_message :notice, flash_key
        end
        sign_in resource_name, resource.user, :bypass => true
        respond_with resource
    else
      # if user_temp[:current_password] == nil
      #   set_flash_message :error, 'update_failed'
      # end
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
        u.permit(:email, :password, :password_confirmation, :phone, :profile, :rolable_attributes=>[])
      end
      devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(:email, :password, :password_confirmation, :phone, :profile)
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
        @user_type = current_user.class.name.downcase
      end
    end

    def user_params
      
      user_attrs      = [:email, :password, :password_confirmation, :phone, :profile, :donor]
      charity_attrs   = [:name, :eid, :description, :video_url, :video_url_html, :mission_statement, :cover_photo, :target_area, :category_id, :rolable]
      business_attrs  = [:name, :goods, :description, :services, :slogan, :rolable]
      donor_attrs     = [:title, :first_name, :last_name, :middle_initial, :rolable]
      # For a new user 
      #apply to correct parameter
      if(params[:user] && !params[:user][:rolable_attributes].nil?) # || !params[:user][:business].nil? || !params[:user][:donor].nil? )
        case @user_type
          when "charity"
            params[:user][:rolable_attributes] = params[:user][:rolable_attributes].permit(charity_attrs)
          when "business"
            params[:user][:rolable_attributes] = params[:user][:rolable_attributes].permit(business_attrs)
          when "donor"
            params[:user][:rolable_attributes] = params[:user][:rolable_attributes].permit(charity_attrs)
        end
      elsif !params[:charity].nil? || !params[:business].nil? || !params[:donor].nil?
        case @user_type
          when "charity"
             params[:charity] = params[:charity].permit(charity_attrs, :user => user_attrs)
          when "business"
            params[:business] = params[:business].permit(business_attrs, :user => user_attrs)
          when "donor"
            params[:donor] = params[:donor].permit(donor_attrs, :user => user_attrs)
        end
      end
    end  
    #   if params[:user].nil? && !@current_user.nil?
    #     if !@current_user.rolable_type.nil?
    #       @user_type = @current_user.rolable_type.downcase
    #     else 
    #       @user_type = "donor"
    #     end
    #   elsif !params[:user].nil? && @current_user.nil?
    #     if(params[:user][:user_type])
    #       @user_type = params[:user][:user_type]
    #       if @user_type.nil?
    #         if params[:Donor]
    #           @user_type = "donor"
    #         elsif params[:Business]
    #           @user_type = "business"
    #         elsif params[:Charity]
    #           @user_type = "charity"
    #         end
    #       end
    #     elsif (params[:user][:charity] || params[:user][:business] || params[:user][:donor])
    #       if(params[:user][:charity])
    #         @user_type = "charity"
    #       elsif (params[:user][:business])
    #          @user_type = "business"
    #       elsif (params[:user][:donor])
    #         @user_type = "donor"
    #       end
    #     end 
            
    #   elsif !params[:user].nil? && !current_user.nil?
    #     @user_type = current_user.user.rolable_type.underscore
    #   else
    #     render root_path
    #   end
    #     # update 




    #   if !params[:user].nil? && current_user
    #     Rails.logger.info("Step 1 - >>>")
    #     # params[:user][:user_attributes].delete(:id)
    #     params[:user] = params[:user].permit(user_attrs)

    #     @user_type = @user_type.camelize
    #     case @user_type
    #       when "charity"
    #         params[:user][:Charity].delete(:id)
    #         params[:Charity].permit(charity_attrs)
    #       when "business"
    #         params[:user][:Business].delete(:id)
    #         params[:Business].permit(business_attrs)
    #       when "Donor"
    #         params[:user].delete(:id)
    #         params[:user].permit(donor_attrs)
    #     end
    #     # new
    #   # elsif !params[:charity].nil? || !params[:business].nil? || !params[:donor].nil?
    #   #   Rails.logger.info("Step 2 - >>>")
    #   #   case @user_type
    #   #     when "charity"
    #   #        params[:charity].permit(charity_attrs)
    #   #     when "business"
    #   #       params[:business].permit(business_attrs)
    #   #     when "donor"
    #   #       params[:donor].permit(donor_attrs)
    #   #   end
    #   #   # new failed first time
    #   #   raise
    #   elsif !params[:user][:charity].nil? || !params[:user][:business].nil? || !params[:user][:donor].nil?
    #     Rails.logger.info("Step 3 - >>>")
    #     Rails.logger.info(@user_type)
    #     case @user_type
    #       when "charity" || "Charity"
    #          Rails.logger.info("case1")
    #         params[:user][:charity].permit(charity_attrs)
    #       when "business" || "Business"
    #          Rails.logger.info("case2")
    #         params[:user][:business].permit(business_attrs)
    #       when "donor" || "Donor"
    #         Rails.logger.info("maybe")
    #          params[:user][:donor].permit(donor_attrs)
    #     end
    #   elsif !current_user.nil?
    #     @user_type = current_user.user.rolable_type.underscore
    #   else
    #     @user_type = "something_is_wrong_and"
    #   end
    # end

end



