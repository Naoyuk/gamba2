Rails.application.routes.draw do
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

  resources :posts do
    collection do
      get :crags_select
      get :areas_select
      get :routes_select
    end
  end

  resources :regions, only: :index do
    collection { post :import }
  end

  resources :routes do
    collection do
      get :areas_select
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
