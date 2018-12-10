Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :movies do
    collection do
      get 'search_results', to: "movies#search_results"
    end
    member do
      get 'watch', to: "movies#watch"
    end
    resources :movie_playlists, only: [ :create, :destroy]
    resources :watchlist_items, only: [ :create, :destroy]
  end
  resources :playlists
  resources :users do
    collection do
      get 'mywatchlist', to: "users#mywatchlist"
    end
    member do
      post :follow
      post :unfollow
    end
    resources :followed_playlists
  end
end
