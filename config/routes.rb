Rails.application.routes.draw do
  resources :mails, only: [:new, :index]
  root "top#index"
  get "/register" => "mails#new"
  resources :password_resets, only: [:new, :create, :index]

  resources :users do
    resources :rooms
    resources :timetables
    resources :requests, except: [:edit, :update]
    resources :posts, only: [:index, :show]
  end
  resources :posts
  resources :users, only: [:index, :show] do
    resource :follows, only: [:index, :create, :destroy]
    get 'followings' => 'follows#followings', as: 'followings'
    get 'followers' => 'follows#followers', as: 'followers'

    resource :deals, only: [:index, :create, :destroy]
    get 'blockings' => 'blocks#blockings', as: 'blockings'
    get 'blockers' => 'blocks#blockers', as: 'blockers'

    resource :reports, only: [:create, :destroy]
    get 'reportings' => 'reports#reportings', as: 'reportings'
    get 'reporters' => 'reports#reporters', as: 'reporters'
    resources :tags
  end
  resource :account, except: [:index, :destroy] do
    resource :follows, only: [:index, :create, :destroy]
    get 'followings' => 'follows#followings', as: 'followings'
    get 'followers' => 'follows#followers', as: 'followers'
    resources :tags
    resources :posts
    resources :timetables
  end
  resource :password, only: [:edit, :update]
  resources :user_tags
  resources :timetables, only: [:index, :show, :edit, :update] do
    get "search", on: :collection
  end
  resources :requests
  resources :tags do
    get "tag_search", on: :collection
  end
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
    resources :reports, only: [:index, :destroy]
  end
end
