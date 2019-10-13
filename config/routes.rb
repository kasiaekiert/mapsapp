Rails.application.routes.draw do
  devise_for :users
  resources :places
  resources :events
  resources :users, only: [:show, :index]
  resources :settings, only: [:update]

  root "places#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
