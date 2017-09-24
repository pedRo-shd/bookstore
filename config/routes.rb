Rails.application.routes.draw do
  resources :categories
  resources :books
  root 'pub#index'

  get    'livro/:id'   => 'pub#book',   as: 'pub_book'
  get    'autor/:id'   => 'pub#author', as: 'pub_author'
  get    'comprar/:id' => 'pub#buy',    as: 'buy'
  get    'pedido/:id'  => 'pub#order',  as: 'order'
  get    'busca'       => 'pub#search'

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
