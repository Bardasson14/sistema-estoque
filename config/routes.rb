Rails.application.routes.draw do
  devise_for :usuarios
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'cadastrar_usuario' => 'usuarios#new'
  resources :usuarios, only: [:show, :index, :destroy] # adicionar update depois
  resources :produtos
  resources :colaboradores
  resources :movimentacoes

  get '/cadastrar_colaborador', to: 'usuarios#new'
  get '/acesso_negado', to: 'application#acesso_negado'
  
  # devise_scope :usuario do
  #   get 'sign_up', to: 'devise/registrations#new'
  #   get 'sign_in', to: 'devise/sessions#new'
  #   post 'sign_in', to: 'devise/sessions#create'
  #   delete 'sign_out', to: 'devise/sessions#destroy'
  #   get 'recuperar_senha', to: 'devise/passwords#new'
  # end
  
  root 'dashboard#index'
end
