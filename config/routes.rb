Bigheart::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "users/omniauth_callbacks"}
  resources :users
  resources :stories

  #get 'auth/:provider/callback' => 'users#create'
  #get 'auth/failure' => redirect('/')
  #get 'signout' => 'users#destroy', as: 'signout'

  root :to => "stories#index"
end