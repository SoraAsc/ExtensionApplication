Rails.application.routes.draw do
  # root 'home#index'
  # get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/singin', to: 'login#index'
  get '/singup', to: 'registration#index'
  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
end
