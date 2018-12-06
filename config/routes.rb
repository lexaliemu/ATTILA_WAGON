Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :movies do
    collection do
      get 'search_results', to: "movies#search_results"
    end
    member do
      get 'movie', to: "movies#show"
    end
  end
  resources :playlists do
    member do
      get 'playlist', to: "playlists#show"
    end
  end

end
