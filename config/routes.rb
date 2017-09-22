Rails.application.routes.draw do
  resources :blogs
  resources :music
  
  resources :blogs do 
    resources :music
  end
  get 'pages/home'

  devise_for :users, controllers: { omniauth_callbacks: 'auth/callbacks' }
 
 root to: "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
