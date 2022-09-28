Rails.application.routes.draw do
  resources :mails, only: [:new, :index]
  root "top#index"
  get "/register" => "mails#new"
  resources :password_resets, only: [:new, :create, :index]

  resources :users do
    resources :rooms
    resources :timetables
    resources :requests, except: [:edit, :update]
  end
  resources :users, only: [:index, :show] do
    resource :follows, only: [:index, :create, :destroy]
    get 'followings' => 'follows#followings', as: 'followings'
    get 'followers' => 'follows#followers', as: 'followers'
    resources :tags
  end
  resource :account, except: [:index, :destroy] do
    resource :follows, only: [:index, :create, :destroy]
    get 'followings' => 'follows#followings', as: 'followings'
    get 'followers' => 'follows#followers', as: 'followers'
    resources :tags do
      get "image_set", on: :collection
    end
    resources :user_tags
  end
  resources :user_tags
  resources :timetables, only: [:index, :show, :edit, :update] do
    get "search", on: :collection
  end
  resources :requests
  resources :rooms do
    resources :messages
  end
  resources :messages
  resource :session, only: [:create, :destroy]

  resource :profile,only: %i[show edit update]

  resources :announces, only: [:index]

  namespace :admin do
    root "top#index"
    resource :session, only: [:create, :destroy]
    resources :announces, except: [:show]
    resources :users do
      resource :follows, only: [:create, :destroy]
      get 'followings' => 'follows#followings', as: 'followings'
      get 'followers' => 'follows#followers', as: 'followers'
    end
    resources :requests, only: [:index, :edit, :update]
  end
end
