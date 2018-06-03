Rails.application.routes.draw do
  get 'welcome/index'
  constraints ->  request { request.session[:user_id].present? } do
    # ログインしてる時のパス
    # root to: "posts#index"
    root to: 'welcome#index'
  end
  # ログインしてない時のパス
  root to: 'sessions#new'
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
