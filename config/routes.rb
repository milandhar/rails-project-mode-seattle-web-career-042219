Rails.application.routes.draw do
  #get 'users/:id/analytics', to: 'users#analytics'
  resources :cards
  resources :hands
  resources :rounds
  resources :users
  resources :session
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
