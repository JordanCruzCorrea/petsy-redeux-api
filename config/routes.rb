Rails.application.routes.draw do
  resources :users, only: [:create, :update, :destroy]
  resources :items

  post '/auth/login', to: 'authentication#login'
  get '/auth/verify', to: 'authentication#verify'

  get '/users/:id/items', to: 'users#user_items'

  get '/items/for/:category', to: 'items#categories'
end
