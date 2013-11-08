Blankcomposer::Application.routes.draw do
  resources :addresses

  resources :groupgrants
  resources :charities
  resources :donors 
  resources :businesses
  resources :authentications

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
