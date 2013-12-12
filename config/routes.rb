Bigheart::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "users/omniauth_callbacks"}
  resources :users
  resources :stories

  root :to => "home#index"
end