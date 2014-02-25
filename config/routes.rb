Blankcomposer::Application.routes.draw do

  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being the default of "spree"
  mount Spree::Core::Engine, :at => '/store'
  match '/payments/payment', :to => 'payments#payment', :as => 'paymentspayment', :via => [:get]
  match '/payments/thank_you', :to => 'payments#thank_you', :as => 'payments_thank_you', :via => [:get]
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


  root :to => 'visitors#new'

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "authentications", registrations: "registrations"}
  match '/users/auth/:provider/callback' => 'authentications#create', via: :get

  match '/users/profile' => 'visitors#profile', via: :get

 devise_scope :user do
  match 'charity/sign_up' => 'registrations#new', :user => { :user_type => 'charity' }, via: :get, as: 'charity_sign_up'
  match 'donor/sign_up' => 'registrations#new', :user => { :user_type => 'donor' }, via: :get, as: 'donor_sign_up'
  match 'business/sign_up' => 'registrations#new', :user => { :user_type => 'business' }, via: :get, as: 'business_sign_up'

  get '/login', :to => "devise/sessions#new"
  get '/signup', :to => "devise/registrations#new"
  delete '/logout', :to => "devise/sessions#destroy"


  # match 'charity/edit' => 'registrations#edit', :user => { :user_type => 'charity' }, via: :get, as: 'charity_edit'
  # match 'donor/edit' => 'registrations#edit', :user => { :user_type => 'donor' }, via: :get, as: 'donor_edit'
  # match 'business/edit' => 'registrations#edit', :user => { :user_type => 'business' }, via: :get, as: 'business_edit
  
  end
 
  match "/groupgrant/connect", :to => "groupgrants#connect", via: :post
  match "/groupgrant/cancelRequest", :to => "groupgrants#cancelRequest", via: :post
  match "/messages/getAjax", :to => "messages#getAjax", via: :post
  match "/messages/checkAjax", :to => "messages#checkAjax", via: :post
  match "/messages/searchUsers", :to => "messages#searchUsers", via: :post
  match "/groupgrant/payment_form", :to => "groupgrants#payment_form", via: :get
  match "/groupgrant/payment_form", :to => "groupgrants#payment_form_post", via: :post
end
