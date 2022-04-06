Rails.application.routes.draw do
  resources :projects do
    resources :features
    resources :bugs
  end

  devise_scope :user do  
    root to: "devise/sessions#new"     
  end

  devise_for :users


  # root 'home#index'
  # root to: "devise/sessions#new"
  get 'dashboard', to: 'home#dashboard'
  post 'create_user', to: 'users#create'
  # patch 'create_user', to: 'users#update'
  # resources :users, only: [:index]
  resources :users
  # get 'users', to: 'users#index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
