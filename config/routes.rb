Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, param: :role
  # post '/auth/login', to: 'authentication#login'

  # TODO: Uncomment when re-doing auth
  # post 'authenticate', to: 'authentication#authenticate'

  #   resources :income
  # end

  resources :transaction # :controller => 'transaction'
  post 'transaction', to: 'transaction#create'

  # get '/*a', to: 'application#not_found'

  # Defines the root path route ("/")
  root 'users#index'

  post 'budget/calculate_budget', to: 'budget#calculate_budget'
  post 'budget/create', to: 'budget#create'

  # OR
  # resources :budget, only: [:create]
  #
  # resources :budget do
  #   collection do
  #     post 'calculate_budget'
  #   end
  #   member do
  #     post 'create'
  #   end
  # end

end
