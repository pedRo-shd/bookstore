Rails.application.routes.draw do

  get 'pub/index'

  get 'pub/sobre'

  resources :people
  resources :sessions, only: %i(new create destroy)

  get "autenticar"  => "sessions#new"
  post "autenticar" => "sessions#create"
  delete "sair"     => "sessions#destroy"
end
