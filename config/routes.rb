Writ::Application.routes.draw do
  
  namespace :pen do
    
    resources :sessions, only: [ :new, :create, :destroy ]
    match '/login'  => 'sessions#new', as: :login
    match '/logout' => 'sessions#destroy', as: :logout
    
    resources :inquiries, only: [ :index, :update ]
    resources :pieces, only: [ :index, :create, :update ]
    
    root to: 'pieces#index'
    
  end
  
  resources :pieces, only: [ :index, :show ]
  resources :inquiries, only: [ :new, :create ]
  
  root to: 'public#index'

end
