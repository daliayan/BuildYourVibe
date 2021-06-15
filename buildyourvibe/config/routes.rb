Rails.application.routes.draw do
    root to: 'sessions#welcome'

    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'
    resources :users


end