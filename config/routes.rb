# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # devise_scope :user do
  #   get 'events/index'
  # end
  resources :places
  resources :events do
    resource :members, only: %i[create destroy]
  end
  resources :settings, only: [:update]

  get 'profile', to: 'profile#show'
  root 'places#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
