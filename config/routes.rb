Rails.application.routes.draw do
  resources :automails
  root "top#index"

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
end
