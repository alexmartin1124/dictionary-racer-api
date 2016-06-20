Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :puzzles
      post '/puzzles', to: 'puzzles#create'
      resources :users
      get '/users/current-user', to: 'current_user#show'
      post '/users', to: 'users#create'
      post '/puzzles/:id', to: 'puzzles#update'
      resources :entries
    end
  end
  post '/login', to: 'sessions#create'

end
