Rails.application.routes.draw do
  root "blogs#index"
  resources :users
  resources :blogs do
  resources :comments
end



  get "/login" => "sessions#new"
  post "/login" => "users#login"
  post "/logout" => "sessions#destroy"

end
