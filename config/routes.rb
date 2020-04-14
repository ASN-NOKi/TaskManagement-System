Rails.application.routes.draw do
  # get '/tasks', to: 'tasks#index'
  get '/task', to: 'tasks#show'
  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users do
    resources :tasks
  end
end
