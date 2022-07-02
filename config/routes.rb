Rails.application.routes.draw do
  root "top#index"

  resources :users do
    resources :rooms
  end
  resource :session, only: [:create, :destroy]
  resources :rooms
  # resources :user_rooms
  # end
end
