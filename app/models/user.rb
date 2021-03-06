class User < ActiveRecord::Base
  has_many :authentications, dependent: :destroy
  has_many :addresses, :dependent => :destroy
  belongs_to :rolable, :polymorphic => true, dependent: :destroy

  has_many :spree_orders
  has_many :spree_addresses
  has_many :messages, :dependent => :destroy

  belongs_to :rolable, :polymorphic => true
  has_and_belongs_to_many :spree_roles

  validates :email, presence: {is: true, message: "Please enter an e-mail address"},
     format: {with:/^[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}$/, :multiline => true, message: "Please enter a valid e-mail"}
  validates :phone, format: {with: /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})$/, multiline: true,
                             message: "Please enter a valid phone number"}     
  accepts_nested_attributes_for :rolable

  has_attached_file :profile, :styles => { :medium => "300x300>", :small => "200x200>", :thumb => "100x100>" }, 
    :default_url =>  ActionController::Base.helpers.asset_path("medium/missing.jpg")

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid
  # attr_accessible :title, :body
  
  def apply_omniauth(omni)
    authentications.build(:provider => omni['provider'], 
                          :uid => omni['uid'], 
                          :token => omni['credentials'].token, 
                          :token_secret => omni['credentials'].secret)
  end
  
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
    end
  end
    
  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end
  
  def password_required?
    (authentications.empty? || !password.blank?) && super #&& provider.blank?
  end
  
  
  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(  provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20]
                           )
    end
    user
  end     
end
