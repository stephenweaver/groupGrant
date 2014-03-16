class AuthenticationsController < ApplicationController
  def index
    @authentications = Authentication.where(user_id: current_user.id)
  end

    def charityLogin
    charity = User.where(rolable_type: "Charity", is_available: 1).first
    if charity != nil
      charity.is_available = 0
      sign_in_and_redirect charity
      
      flash[:notice] = "You are logged in as a charity."
    else
      redirect_to root_path
      flash[:notice] = "No charities are available. Please register below"

    end
  end

  def businessLogin
    business = User.where(rolable_type: "Business", is_available: 1).first
    if business != nil
      business.is_available = 0
      sign_in_and_redirect business
      flash[:notice] = "You are logged in as a business."
    else
      redirect_to root_path
      flash[:notice] = "No businesses are available. Please register below"
    end
  end

  def donorLogin
    donor = User.where(rolable_type: "Donor", is_available: 1).first
    if donor != nil
      donor.is_available = 0
      sign_in_and_redirect donor      
      flash[:notice] = "You are logged in as a donor."
    else
      redirect_to root_path
      flash[:notice] = "No donors are available. Please register below"
    end
  end

  def logout
    if user_signed_in?
      current_user.is_available = 1
      current_user.save!
      sign_out_and_redirect current_user
      flash[:notice] = "Logout Successful."
    else
      flash[:notice] = "An impossible error occured. Please notify the webmasters."
    end
  end

  def twitter
    
    omni = request.env["omniauth.auth"]

    authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])

    if authentication
      user = User.find(authentication.user_id)
      user.is_available = 0
      user.save!
      flash[:notice] = "Logged in Successfully"
      sign_in_and_redirect User.find(authentication.user_id)
    elsif current_user
      token = omni['credentials'].token
      token_secret = omni['credentials'].secret
      
      current_user.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], :token => token, :token_secret => token_secret)
      current_user.is_available = 0
      current_user.save!
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
        user.is_available = 0
        user.save!
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
      user = User.find(authentication.user_id)
      user.is_available = 0
      user.save!
      sign_in_and_redirect User.find(authentication.user_id)
    elsif current_user
      token = omni['credentials'].token
      token_secret = ""
      
      current_user.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], :token => token, :token_secret => token_secret)
      
      flash[:notice] = "Authentication successful."
      current_user.is_available = 0
      current_user.save!
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
        user.is_available = 0
        user.save!
        flash[:notice] = "Logged in."
        sign_in_and_redirect User.find(user.id)             
      else
        if(user.errors.messages[:email])
          flash[:warning] = "#{user.email} has already been registered. Please log in with you password and then enable facebook authentication."  
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

  def new
   render text: "hi"
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
