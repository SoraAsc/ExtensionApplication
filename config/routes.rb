Rails.application.routes.draw do
  # devise_for :usuarios
  devise_for :usuarios, path: '', path_names: { sign_in: 'login', sign_up: 'criar_conta' }, controllers: { registrations: 'registration' }

  get '/estudante', to: 'estudante#index'
  get '/estudante/submeter_extensao', to: 'estudante#submeter_extensao'
  post '/estudante/submeter_extensao', to: 'estudante#submeter_extensao'

  get '/coordenador', to: 'coordenador#index'
  get '/coordenador/validar_extensao', to: 'coordenador#validar_extensao'

  resources :extensaos

  # root 'home#index'
  # get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get '/singin', to: 'login#index'
  # get '/singup', to: 'registration#index'
  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
end
