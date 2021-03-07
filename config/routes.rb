Rails.application.routes.draw do
  get 'passengers/new'
  get 'passengers/create'
  get 'bookings/new'
  get 'bookings/create'
  get 'flights/index'
  root "flights#index"

  resources :flights, only: [:index]
  resources :bookings, only: [:new, :create]
  resources :passengers, only: [:new, :create]
  
end
