Rails.application.routes.draw do
  root to: "pages#home"

  resources :users
  resources :meals

  post '/sign_in', to: 'sessions#create'
end
