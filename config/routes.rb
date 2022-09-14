Rails.application.routes.draw do
  resources :automails, only: [:new, :create, :destroy, :index]
  root "top#index"
  get "/register" => "automails#new"
  resources :password_resets, only: [:new, :create, :index]

  resources :users do
    resources :rooms
    resources :timetables
    resources :requests, except: [:edit, :update]
  end
  resources :requests
  resources :rooms do
    resources :messages
  end
  resources :messages
  resource :session, only: [:create, :destroy]
  resource :account, except: [:index, :destroy]

  resource :profile,only: %i[show edit update]

  resources :users, only: [:index, :show] do
    resource :follows, only: [:create, :destroy]
    get 'followings' => 'follows#followings', as: 'followings'
    get 'followers' => 'follows#followers', as: 'followers'
  end
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
