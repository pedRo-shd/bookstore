Rails.application.routes.draw do
  resources :categories
  resources :books
  root 'pub#index'

  get  'pub/sobre'
  get  'livro/:id'   => 'pub#book',   as: 'pub_book'
  get  'autor/:id'   => 'pub#author', as: 'pub_author'
  get  'comprar/:id' => 'pub#buy',    as: 'buy'
  get  'busca' => 'pub#search'
  get  'carrinho' => 'pub#cart', as: 'cart'

  resources :people do
    collection do
      get :admins
    end
  end

  resources :sessions, only: %i(new create destroy)

  get  "autenticar" => "sessions#new"
  post "autenticar" => "sessions#create"
  delete "sair"     => "sessions#destroy"

end
