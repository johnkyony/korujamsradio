Rails.application.routes.draw do
  get 'pages/home'

devise_for :users, controllers: { omniauth_callbacks: 'auth/callbacks' }
 
 root to: "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
