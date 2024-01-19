Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
  get 'home', to: 'home#index'
  get 'privacy', to: 'pages#privacy', as: 'privacy'
  resources :contacts, only: [:new, :create]
   # ログインページへのパス（既に定義してある場合は不要）
   get 'login', to: 'sessions#new', as: 'login'
  
   # ユーザー登録ページへのパス
   resources :users, only: [:new, :create]
   resources :characters, only: [:new, :create]
   get 'choose_animal', to: 'animals#new', as: 'choose_animal'
end
