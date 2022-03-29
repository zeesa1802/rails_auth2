Rails.application.routes.draw do

  resources :articles

  resources :projects do
    resources :features
    resources :bugs
  end

# devise_scope :user do  
#    get '/users/sign_out' => 'devise/sessions#destroy'     
# end

devise_for :users


root 'home#index'
get 'dashboard', to: 'home#dashboard'
post 'create_user', to: 'users#create'
# resources :users, only: [:index]
resources :users
# get 'users', to: 'users#index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
