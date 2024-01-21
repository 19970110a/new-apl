Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'static_pages#home'  # トップページ（ルートURL）を static_pages#home に設定
  get 'home', to: 'static_pages#home'
  get 'contact', to: 'static_pages#contact'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  resources :users, only: [:new, :create]
   # ログインページへのパス（既に定義してある場合は不要）
   get 'login', to: 'sessions#new', as: 'login'
  
   # ユーザー登録ページへのパス
   resources :users, only: [:new, :create]
   resources :characters, only: [:index]
   get 'choose_character', to: 'characters#index', as: 'choose_character'
end
