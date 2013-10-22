Blankcomposer::Application.routes.draw do
  resources :authentications
  root :to => 'visitors#new'
  # root to: 'authentications#home'

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "authentications", registrations: "registrations"}
  match '/users/auth/:provider/callback' => 'authentications#create', via: :get

end
