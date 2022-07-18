Rails.application.routes.draw do
  

  root "bookings#index"

  devise_for :users
  resources :bookings

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
