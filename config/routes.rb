Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :puzzles
      resources :users
      resources :entries
    end
  end
end
