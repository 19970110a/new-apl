Rails.application.routes.draw do
  get 'drinks/choose'
  get 'home/top'
  get 'sessions/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'static_pages#home'  # トップページ（ルートURL）を static_pages#home に設定
  get 'home', to: 'static_pages#home'
  get 'contact', to: 'static_pages#contact'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new', as: :login
  # ログイン処理を行うためのルート
  post 'login', to: 'sessions#create'
  # ログアウト処理を行うためのルート
  delete 'logout', to: 'sessions#destroy', as: :logout
   # ユーザー登録ページへのパス
   resources :users, only: [:new, :create]
   resources :characters, only: [:index]
   get 'choose_character', to: 'characters#index', as: 'choose_character'
   get 'top', to: 'home#top', as: :top
   get 'choose_drink', to: 'drinks#choose', as: :choose_drink
   resources :drinks do
    member do
      post :increment
      post :decrement
    end
  end
  resources :user_drinks, only: [:new, :create]
end
