Rails.application.routes.draw do

  root 'home#index'

  resources :groups do
    resources :group_members, only: [:new, :create]
  end
  resources :events, except: [:delete]

  get '/dashboard', to: 'dashboard#index'

  get '/search', to: 'search#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
