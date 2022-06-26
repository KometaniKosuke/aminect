Rails.application.routes.draw do
  root "top#index"
  
  resources :users
    # resources :user_rooms
  # end
  resources :rooms
  # resources :user_rooms
  # end
end
