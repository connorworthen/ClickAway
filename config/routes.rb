Rails.application.routes.draw do
  
  root to: 'main#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create' 
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/search' => 'search#search', :as => :search_page

  get '/auth/facebook/callback' => 'sessions#omniauth'
  get 'auth/failure', to: redirect('/')

  resources :users

  resources :manufacturers, only: [:show, :search, :new, :create, :update, :destroy] do
    resources :products, only: [:new, :create, :update, :delete]
  end

  resources :products, only: [:new, :create, :show, :edit, :update] do 
    resources :reviews, only: [:index, :new, :create, :show, :destroy]
  end

  resources :users do
    get :manufacturer, on: :member
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end