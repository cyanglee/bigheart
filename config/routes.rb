Bigheart::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "users/omniauth_callbacks"}
  resources :users do
    member do
      get :stories, action: "users_stories"
    end
  end

  resources :stories do
    collection do
      get :manage, action: "manage_stories"
    end
    member do
      get 'update_state', to: 'stories#update_state'
    end
  end

  post 'send_mail/report'

  root :to => "stories#index"
end