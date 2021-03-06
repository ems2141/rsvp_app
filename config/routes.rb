Rails.application.routes.draw do
  get '/welcome', to: 'welcome#index'
  get '/', to: 'register#index'

  resources :register, only: [:index, :new, :create]

  get '/login', to: 'login#index'
  get '/table_seating/new', to: 'table_seating#new'
  post '/table_seating/create', to: 'table_seating#create'
  get '/table_seating/:id', to: 'table_seating#show', as: :table_seating

  resources :users, only: [:index]
  resource :session, only: [:create, :destroy]
  resources :photos, only: [:index]
end
