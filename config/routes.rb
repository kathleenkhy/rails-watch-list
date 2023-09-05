Rails.application.routes.draw do
  get 'lists/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'lists#index'
  resources :movies, only: %i[show index edit update]

  resources :lists do
    resources :bookmarks
  end
end
