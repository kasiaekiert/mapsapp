Rails.application.routes.draw do
  devise_for :users
  resources :places
  resources :events do 
    resources :members, only: [:create, :delete]
    resources :profile, only: [:delete]
  end
  resources :settings, only: [:update]

  get "profile", to: "profile#show"
  

  root "places#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
