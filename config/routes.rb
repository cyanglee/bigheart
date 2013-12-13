Bigheart::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "users/omniauth_callbacks"}
  resources :users do
    member do
      get :stories, action: "users_stories"
    end
  end

  resources :stories

  root :to => "home#index"
end