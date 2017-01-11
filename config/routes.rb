Rails.application.routes.draw do

  root 'home#index'

  resources :groups, except: [:destroy] do
    resources :group_members, only: [:create, :destroy]
  end

  resources :events, except: [:destroy] do
    resources :rsvps, only: [:edit, :update]
  end

  resources :restaurants, only: [:show] do
    resources :reviews, only: [:index, :new, :create]
  end

  get '/dashboard', to: 'dashboard#index'

  get '/search', to: 'search#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
