Rails.application.routes.draw do

  resources :books
  root 'pub#index'

  resources :people
  resources :sessions, only: %i(new create destroy)

  get "autenticar"  => "sessions#new"
  post "autenticar" => "sessions#create"
  delete "sair"     => "sessions#destroy"
end
