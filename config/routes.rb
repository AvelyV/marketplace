Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :listings
  resources :ratings
  devise_for :users
  root 'pages#home'
  resources :webhooks, only: [:create]
  get "/buy/:listing_id", to: "orders#buy", as: "buy"
  get "/success", to: "orders#success", as: "success"
  get "/cancel", to: "orders#cancel", as: "cancel"


  get "/search", to: "listings#search", as: "search"

  # giving a rating
  get "/rating/:id", to: "ratings#new", as: "create_rating"
  
  # profile page
  get "/user/:id", to: "users#show", as: "user"
end
