Rails.application.routes.draw do

  resources :people
  resources :sessions, only: %i(new create destroy)

end
