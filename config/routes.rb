Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  resources :users, param: :role
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  # Defines the root path route ("/")
  root "users#index"
end
