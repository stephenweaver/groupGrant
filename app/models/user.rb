class User < ActiveRecord::Base
   has_many :authentications
   has_many :products
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable, :omniauth_providers => [:facebook]

   # def self.from_omniauth(auth)
   #    where(auth.slice(:provider, :iud)).first_or_initialize.tap do |user|
   #       user.provider = auth.provider
   #       user.uid = auth.id
   #       user.name = auth.info.name
   #       user.oauth_token = auth.credentials.token
   #       user.oauth_expires_at = Time.at(auth.creFentials.expires_at)
   #       user.save!
   #    end
   # end

   def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
      user = User.where(:fb_provider => auth.provider, :fb_uid => auth.uid).first
      unless user
         user = User.create(fb_name:auth.extra.raw_info.name,
                         fb_provider:auth.provider,
                         fb_uid:auth.uid,
                         email:auth.info.email,
                         fb_oath_token:Devise.friendly_token[0,20]
                         )
      end
      user
   end

   def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
