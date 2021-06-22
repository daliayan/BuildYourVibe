Rails.application.routes.draw do
    root 'sessions#welcome'

    resources :users do
        resources :houses #shallow: true routing to avoid deep nesting
    end

    get '/signup' => 'users#new'
    post '/signup' => 'users#create'

    # get '/login' => 'sessions#new'
    # post '/login' => 'sessions#create'
    resources :sessions, only: [:create]

    get '/logout' => 'sessions#destroy'

    # resources :users do
    #     resources :houses #shallow: true routing to avoid deep nesting
    # end

    resources :rooms do
        resources :comments
    end
    resources :comments

    # resources :houses, only: [:new, :index, :show]
end