Rails.application.routes.draw do
  resources :automails, only: [:new, :create, :destroy, :index]
  root "top#index"
  get "/register" => "automails#new"

  resources :users do
    resources :rooms
    resources :timetables
  end
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

  namespace :admin do
    root "top#index"
    resources :users do
      resource :follows, only: [:create, :destroy]
      get 'followings' => 'follows#followings', as: 'followings'
      get 'followers' => 'follows#followers', as: 'followers'
    end
  end
end
