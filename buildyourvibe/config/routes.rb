Rails.application.routes.draw do
    root to: 'sessions#welcome'

    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    get '/signup' => 'users#new'
    post '/signup' => 'users#create'
    resources :users

    resources :houses do
        resources :comments
    end

    resources :comments
end