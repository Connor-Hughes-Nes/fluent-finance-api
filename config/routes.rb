Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, param: :role
  # post '/auth/login', to: 'authentication#login'
  post 'authenticate', to: 'authentication#authenticate'

  # get '/*a', to: 'application#not_found'

  # Defines the root path route ("/")
  root 'users#index'

  # get '/budget' => 'budget#index'
  # get '/category' => 'category#index'
  # get '/transaction' => 'transaction#index'

  resources :budget, only: [:create]
end
