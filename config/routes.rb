Rails.application.routes.draw do
  # get '/tasks', to: 'tasks#index'
  # get '/task', to: 'tasks#show'
  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users, except: [:new] do
    member do
      get 'tasks_index'
    end
    resources :tasks, except: [:index]
  end
end
