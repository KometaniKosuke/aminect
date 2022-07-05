Rails.application.routes.draw do
  root "top#index"

  resources :users do
    resources :rooms
  end
  resources :rooms do
    resources :messages
  end
  resources :messages
  resource :session, only: [:create, :destroy]
end
