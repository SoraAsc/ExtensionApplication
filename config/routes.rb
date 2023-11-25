Rails.application.routes.draw do
  devise_for :usuarios, path: '', path_names: { sign_in: 'login', sign_up: 'criar_conta' }, controllers: { registrations: 'registration' }

  get '/estudante', to: 'estudante#index'
  get '/estudante/submeter_extensao', to: 'estudante#submeter_extensao'
  post '/estudante/submeter_extensao', to: 'estudante#submeter_extensao'

  get '/coordenador', to: 'coordenador#index'
  get '/coordenador/validar_extensao', to: 'coordenador#validar_extensao'
  post '/coordenador/validar_extensao', to: 'coordenador#validar_extensao'
  get '/coordenador/criar_extensao', to: 'coordenador#criar_extensao'
  post '/coordenador/criar_extensao', to: 'coordenador#criar_extensao'
  get '/coordenador/download_documento', to: 'coordenador#download_documento'

  resources :extensaos
  resources :extensao_realizadas
  root 'home#index'
end
