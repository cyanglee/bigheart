Bigheart::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :stories

  root :to => "stories#index"
end