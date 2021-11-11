Rails.application.routes.draw do
  resources :listings
  resources :ratings
  devise_for :users
  root 'pages#home'
  get "/buy/:listing_id", to: "orders#buy", as: "buy"
  get "/success", to: "orders#success", as: "success"
  get "/cancel", to: "orders#cancel", as: "cancel"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
