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
  get 'drinking_graph', to: 'home#drinking_graph', as: 'drinking_graph'
  get 'home/share', to: 'home#share', as: 'share'
 
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
  resources :drinks, only: [:new, :create]
  get 'choose_drinks', to: 'drinks#choose'
  resources :password_resets, only: %i[new create edit update]
end