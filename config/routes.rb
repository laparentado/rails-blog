Rails.application.routes.draw do
  root "blogs#index"
  resources :users
  resources :blogs


  get "/login" => "sessions#new"
  post "/login" => "users#login"
  post "/logout" => "sessions#destroy"
end
