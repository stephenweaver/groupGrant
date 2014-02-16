Blankcomposer::Application.routes.draw do

  match '/payments/relay_response', :to => 'payments#relay_response', :as => 'payments_relay_response', :via => [:post]
  match '/payments/receipt', :to => 'payments#receipt', :as => 'payments_receipt', :via => [:get]
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

  root :to => 'visitors#new'

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "authentications", registrations: "registrations"}
  match '/users/auth/:provider/callback' => 'authentications#create', via: :get

  match '/users/profile' => 'visitors#profile', via: :get

 devise_scope :user do
  match 'charity/sign_up' => 'registrations#new', :user => { :user_type => 'charity' }, via: :get, as: 'charity_sign_up'
  match 'donor/sign_up' => 'registrations#new', :user => { :user_type => 'donor' }, via: :get, as: 'donor_sign_up'
  match 'business/sign_up' => 'registrations#new', :user => { :user_type => 'business' }, via: :get, as: 'business_sign_up'


  # match 'charity/edit' => 'registrations#edit', :user => { :user_type => 'charity' }, via: :get, as: 'charity_edit'
  # match 'donor/edit' => 'registrations#edit', :user => { :user_type => 'donor' }, via: :get, as: 'donor_edit'
  # match 'business/edit' => 'registrations#edit', :user => { :user_type => 'business' }, via: :get, as: 'business_edit'
  
  
  end
 

end
