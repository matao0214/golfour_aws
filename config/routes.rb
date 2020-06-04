Rails.application.routes.draw do
  root to: 'training_posts#index'
  resources :training_posts do
    resources :likes, only: [:create, :destroy]
  end
  resources :users, except: :index

  get '/top', to: 'top#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
