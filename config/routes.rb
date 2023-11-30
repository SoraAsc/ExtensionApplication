Rails.application.routes.draw do
  root 'home#index'

  devise_for :usuarios, path: '', path_names: { sign_in: 'login', sign_up: 'criar_conta' }, controllers: { registrations: 'registration' }

  get '/estudante', to: 'estudante#index'
  get '/estudante/submeter_extensao', to: 'estudante#submeter_extensao'
  post '/estudante/submeter_extensao', to: 'estudante#submeter_extensao'
  delete '/estudante/:id', to: 'estudante#destroy'

  get '/coordenador', to: 'coordenador#index'
  get '/coordenador/:id', to: 'coordenador#show'
  get '/coordenador/validar_extensao', to: 'coordenador#validar_extensao'
  post '/coordenador/validar_extensao', to: 'coordenador#validar_extensao'
  get '/coordenador/criar_extensao', to: 'coordenador#criar_extensao'
  post '/coordenador/criar_extensao', to: 'coordenador#criar_extensao'

  resources :extensaos
  resources :extensao_realizadas
end
