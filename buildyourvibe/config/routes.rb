Rails.application.routes.draw do
    root 'sessions#welcome'

    get '/signup' => 'users#new'
    post '/signup' => 'users#create'

    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'

    get '/logout' => 'sessions#destroy'

    resources :users do
        resources :houses, only: [:new, :index, :create] #shallow: true routing to avoid deep nesting
    end

    resources :rooms do
        resources :comments
    end
    resources :comments

end