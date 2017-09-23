Rails.application.routes.draw do
  get 'playlistcoverimage/index'

  get 'playlist_songs/index'

  get 'playlists/index'

  resources :blogs
  resources :music
  
  resources :blogs do 
    resources :music
  end
  
  resources :playlists do 
      resources :playlist_songs
  end
  get 'pages/home'

  devise_for :users, controllers: { omniauth_callbacks: 'auth/callbacks' }
 
 root to: "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
