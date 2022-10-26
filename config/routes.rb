Rails.application.routes.draw do
  resources :mails, only: [:new, :index, :create]
  root "top#index"
  get "/register" => "mails#new"
  resources :password_resets, only: [:new, :create, :index]

  # resources :users do
    # resources :rooms
    # resources :timetables
    # resources :posts, only: [:index, :show]
  # end
  resources :posts, only: [:new, :create, :destroy]
  resources :users, only: [:index, :show, :destroy] do
    resource :follows, only: [:index, :create, :destroy]
    get 'followings' => 'follows#followings', as: 'followings'
    get 'followers' => 'follows#followers', as: 'followers'

    resource :deals, only: [:index, :create, :destroy]
    get 'blockings' => 'blocks#blockings', as: 'blockings'
    get 'blockers' => 'blocks#blockers', as: 'blockers'

    resource :reports, only: [:create, :destroy]
    get 'reportings' => 'reports#reportings', as: 'reportings'
    get 'reporters' => 'reports#reporters', as: 'reporters'
    resources :rooms
  end

  resource :account, except: [:index, :destroy] do
    resource :follows, only: [:index, :create, :destroy]
    get 'followings' => 'follows#followings', as: 'followings'
    get 'followers' => 'follows#followers', as: 'followers'
    resources :tags, only: [:new, :create]
    resources :posts, only: [:new, :create, :destroy]
    resources :timetables, only: [:edit, :update]
    resources :requests, only: [:index]
    resource :agrees, only: [:new, :create, :update]
  end

  resource :password, only: [:edit, :update]

  resources :timetables, only: [:index, :edit, :update] do
    get "search", on: :collection
  end

  resources :tags, only: [:index] do
    get "tag_search", on: :collection
  end
  resources :rooms do
    resources :messages
  end
  resources :messages, only: [:create]
  resources :announces, only: [:index]

  resource :session, only: [:create, :destroy]
  resource :profile,only: %i[show edit update]
# -------------------------------------------------------------------
  namespace :admin do
    root "top#index"
    resource :session, only: [:create, :destroy]
    resources :announces
    resources :users do
      resource :follows, only: [:create, :destroy]
      get 'followings' => 'follows#followings', as: 'followings'
      get 'followers' => 'follows#followers', as: 'followers'
    end
    resources :reports, only: [:index, :destroy]
  end
end
