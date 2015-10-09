Rails.application.routes.draw do
  root 'pages#home'
  get '/home', to: 'pages#home'

  resources :recipes do
    member do
      post 'like'
    end
    resources :reviews, shallow: true
  end

  resources :chefs, except: [:new, :destroy] do
      resources :reviews, only: [:index, :show]
  end
  
  get '/register', to: 'chefs#new'
  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'
  
  resources :styles, only: [:new, :create, :edit, :show]
  resources :ingredients, only: [:new, :create, :edit, :show]
end
