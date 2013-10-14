GroupGrant::Application.routes.draw do  

  resources :products

  root :to => 'visitors#new'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  

end
