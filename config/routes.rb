Rails.application.routes.draw do

  root 'home#index'

  resources :groups

  get '/dashboard', to: 'dashboard#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
