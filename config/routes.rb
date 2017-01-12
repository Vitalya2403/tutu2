Rails.application.routes.draw do

  devise_for :users

  resources :tickets, only: [:create, :show]

  resource :search, only: [:new, :show, :edit, :create]

  namespace :admin do
    resources :railway_stations do
      patch :update_position, on: :member
    end
    resources :trains do
      resources :carriages, shallow: true
    end
    resources :economy_carriages
    resources :routes
    resources :tickets
  end

  get 'welcome/index'
    
  root 'searches#show'

  resources :railway_stations do
    patch :update_params, on: :member
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
