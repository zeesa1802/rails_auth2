Rails.application.routes.draw do

  resources :articles

  resources :projects do
    resources :features
  end

# devise_scope :user do  
#    get '/users/sign_out' => 'devise/sessions#destroy'     
# end

devise_for :users


root 'home#index'
get 'dashboard', to: 'home#dashboard'
# resources :users, only: [:index]
resources :users
# get 'users', to: 'users#index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
