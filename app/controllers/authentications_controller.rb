class AuthenticationsController < ApplicationController
  def index
    @authentications = Authentication.where(user_id: current_user.id)
  end

  def twitter
    
    omni = request.env["omniauth.auth"]

    authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])

    if authentication
      flash[:notice] = "Logged in Successfully"
      sign_in_and_redirect User.find(authentication.user_id)
    elsif current_user
      token = omni['credentials'].token
      token_secret = omni['credentials'].secret
      
      current_user.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], :token => token, :token_secret => token_secret)
      flash[:notice] = "Authentication successful."
      sign_in_and_redirect current_user
    else
      
      user = User.new
      user.provider = omni['provider']
      user.uid = omni['uid']
        
      user.apply_omniauth(omni)

      child_class = 'Donor'.constantize
      user.rolable = child_class.create()
      name = omni['extra']['raw_info']['name'].split(' ')
      user.rolable.first_name = name.first
      user.rolable.last_name = name.last
      user.email = "no_email@twitter.com"


      if user.save
        flash[:notice] = "Logged in."
        sign_in_and_redirect User.find(user.id)             
      else
        session[:omniauth] = omni.except('extra')
        redirect_to new_user_registration_path
      end
    end 
  end

  def facebook
    omni = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])
    if authentication
      flash[:notice] = "Logged in Successfully"
      sign_in_and_redirect User.find(authentication.user_id)
    elsif current_user
      token = omni['credentials'].token
      token_secret = ""
      
      current_user.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], :token => token, :token_secret => token_secret)
      
      flash[:notice] = "Authentication successful."
      sign_in_and_redirect current_user
    else
      user = User.new
      user.provider = omni.provider
      user.uid = omni.uid
      user.email = omni['extra']['raw_info'].email 

      user.apply_omniauth(omni)
      child_class = 'Donor'.constantize
      user.rolable = child_class.create()
      user.rolable.first_name = omni['extra']['raw_info'].first_name
      user.rolable.last_name = omni['extra']['raw_info'].last_name

      if user.save
        flash[:notice] = "Logged in."
        sign_in_and_redirect User.find(user.id)             
      else
        if(user.errors.messages[:email])
          flash[:warning] = "#{user.email} has already been registerd. Please log in with you password and then enable facebook authentication."  
        end
        session[:omniauth] = omni.except('extra')
        redirect_to new_user_registration_path
      end
    end
  end

   def create
    raise request.env["omniauth.auth"].to_yaml
    @authentication = Authentication.new(params[:authentication])
    if @authentication.save
      redirect_to authentications_url, :notice => "Successfully created authentication."
    else
      render :action => 'new'
    end
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end

  def home
 
  end

  private
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def authentication_params
      params.require(:authentication).permit(:provider, :uid, :token, :token_secret, :user_id)
    end

  def user_params
    if params[:user].nil? && !@current_user.nil?
      if !@current_user.rolable_type.nil?
        @user_type = @current_user.rolable_type.downcase
      else 
        @user_type = "donor"
      end
    elsif !params[:user].nil? && @current_user.nil?
      @user_type = params[:user][:user_type]
    else
      render root_path
    end

    begin
      if ["donor", "charity", "business"].include? params[:user][:user_type].downcase
        case @user_type
          when "charity"
            params.require(:charity).permit(:name, :eid, :description)
          when "business"
            params.require(:business).permit(:name, :goods, :description, :services)
          when "donor"
             params.require(:donor).permit(:title, :first_name, :last_name, :middle_initial)
        end
      end
    rescue
      @user_type = ""
    end
  end
end
