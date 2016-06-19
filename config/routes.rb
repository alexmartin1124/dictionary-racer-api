Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :puzzles
      post '/puzzles', to: 'puzzles#create'
      resources :users
      get '/users/current-user', to: 'current_user#show'
      resources :entries
    end
  end
  post '/login', to: 'sessions#create'

end
