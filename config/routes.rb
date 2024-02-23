Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  # Static Pages
  root 'static_pages#home'
  get 'home', to: 'static_pages#home'
  get 'contact', to: 'static_pages#contact'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
 
  # Users
  resources :users, only: [:new, :create]
 
  # Sessions
  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: :logout
 
  # Home
  get 'home/top', as: 'home_top'
  get 'top', to: 'home#top', as: :top
  get 'drinking_graph', to: 'home#drinking_graph'
  get 'check_alcohol', to: 'home#check_alcohol'
  get 'home/share', to: 'home#share', as: 'share'
  namespace :api do
    get 'sober_time', to: 'some#sober_time'
  end

  # Drinks
  get 'drinks/choose'
  get 'choose_drink', to: 'drinks#choose', as: :choose_drink
  resources :drinks do
    member do
      post :increment
      post :decrement
    end
  end
 
  # UserDrinks
  resources :user_drinks, only: [:new, :create]
  resources :records, only: [:create]
  get 'choose_drinks', to: 'drinks#choose'
  resources :password_resets, only: %i[new create edit update]
  resources :contacts, only: [:create]
  
  namespace :admin do
    # 管理者用のルーティングをここにまとめる
    get 'login', to: 'sessions#new', as: :login
    post 'login', to: 'sessions#create'
    get 'logout', to: 'sessions#destroy', as: :logout
    resources :random_speeches, only: [:new, :create]
  end  
  namespace :api do
    get 'characters/:id/random_speech', to: 'characters#random_speech'
  end
end