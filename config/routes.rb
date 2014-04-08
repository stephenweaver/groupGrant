Blankcomposer::Application.routes.draw do

  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being the default of "spree"
  mount Spree::Core::Engine, :at => '/store'  

match "/messages/show_all", :to => "messages#show_all",    via: :get

  resources :payments
  resources :groupgrant_categories
  resources :charity_categories
  resources :business_categories
  resources :addresses
  resources :groupgrants
  resources :charities
  resources :donors 
  resources :businesses
  resources :authentications
  resources :charges
  resources :messages
  resources :requests

  root :to => 'visitors#new'

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "authentications", registrations: "registrations"}
  match '/users/auth/:provider/callback' => 'authentications#create', via: :get
  
  match '/users/profile' => 'visitors#profile', via: :get

 devise_scope :user do
  match '/charity/sign_up'  => 'registrations#new', :user => { :user_type => 'charity' },  via: :get, as: 'charity_sign_up'
  match '/donor/sign_up'    => 'registrations#new', :user => { :user_type => 'donor' },    via: :get, as: 'donor_sign_up'
  match '/business/sign_up' => 'registrations#new', :user => { :user_type => 'business' }, via: :get, as: 'business_sign_up'

 

  get '/login',     :to => "devise/sessions#new"
  get '/signup',    :to => "devise/registrations#new"
  delete '/logout', :to => "devise/sessions#destroy"

  end
 
  match "/groupgrant/connect",         :to => "groupgrants#connect",           via: :post
  match "/groupgrant/cancelRequest",   :to => "groupgrants#cancelRequest",     via: :post
  match "/groupgrant/invite_business", :to => "groupgrants#invite_business",   via: :post
  match "/messages/getMessages",       :to => "messages#getMessages",          via: :post
  match "/messages/checkAjax",         :to => "messages#check_for_messages",   via: :post
  match "/messages/searchUsers",       :to => "messages#searchUsers",          via: :post
  match "/messages/new_message_check", :to => "messages#new_message_check",    via: :post
  match "/groupgrants/submit_payment", :to => "groupgrants#payment_form_post", via: :post
  match "/users/active",               :to =>  "visitors#update_last_ping",    via: :post
  match "/requests/response",          :to => "groupgrants#request_response",  via: :post
  match "/requests/accept",            :to => "requests#accept",               via: :post
  match "/requests/reject",            :to => "requests#reject",               via: :post
  
  match "/logout"           => "authentications#logout",        via: :get, as: 'logout_manual'
  match "/logout2"           => "authentications#logout2",        via: :get, as: 'logout_return_expo'
  match "/charityLogin"     => "authentications#charityLogin",  via: :get, as: 'auto_charity_login'
  match "/businessLogin"    => "authentications#businessLogin", via: :get, as: 'auto_business_login'
  match "/donorLogin"       => "authentications#donorLogin",    via: :get, as: 'auto_donor_login'
 


end
