Rails.application.routes.draw do
  

  root "bookings#index"

  devise_for :users

  resources :bookings do
    get "/open_modal", to: "bookings#open_modal", on: :collection
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
