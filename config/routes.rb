GroupGrant::Application.routes.draw do  

  root :to => 'visitors#new'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  

end
