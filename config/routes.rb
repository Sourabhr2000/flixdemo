Rails.application.routes.draw do
  resources :genres
  resources :favorites
  resource :session
  resources :users
  # resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "movies#index"

  # get "movies" => "movies#index"
  # get "movies/:id" => "movies#show", as: "movie"
  # get "movies/:id/edit" => "movies#edit", as: "edit_movie"
  # patch "movies/:id" => "movies#update"
  # get "movies/new" => "movies#new"

  resources :movies do
    resources :reviews
    resources :favorites, only: [:create, :destroy]
  end

  get "movies/filter/:filter" => "movies#index" , as: :filter_movie
  get "signup" => "users#new"
end
