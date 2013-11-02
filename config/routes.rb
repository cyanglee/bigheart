Bigheart::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :stories
  #do
  #  member do
  #    post 'post_new'
  #  end
  #end

  root :to => "stories#index"
end