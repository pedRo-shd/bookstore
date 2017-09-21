Rails.application.routes.draw do

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :people
  resources :sessions, only: %i(new create destroy)
  
end
