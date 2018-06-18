Rails.application.routes.draw do
  get 'routes/index'
  constraints ->  request { request.session[:user_id].present? } do
    # ログインしてる時のパス
    root to: "posts#index"
  end
  # ログインしてない時のパス
  root to: 'sessions#new'
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'

  get 'profile', to: 'users#profile'
  resources :users

  resources :posts

  resources :regions, only: [] do
    resources :crags, only: :index
  end

  resources :crags, only: [] do
    resources :areas, only: :index
  end

  resources :areas, only: [] do
    resources :routes, only: :index
  end

end
