Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'application#home'



  resources :dives
  resources :diver, only: [:new, :create, :show, :index]

# Set up sessions and accounts
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create]
    delete :sessions, to: "sessions#destroy"



end
