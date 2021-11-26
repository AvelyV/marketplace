Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :listings
  resources :ratings
  devise_for :users
  root 'pages#home'

  get "/listings/:listing_id/buy", to: "orders#buy", as: "buy_listing"
  get "/success", to: "orders#success", as: "success"
  get "/cancel", to: "orders#cancel", as: "cancel"

  get "/search", to: "listings#search", as: "search"

  # giving a rating
  get "/rating/:id", to: "ratings#new", as: "create_rating"

  # profile page
  get "/user/:id", to: "users#show", as: "user"

  # location edit
  get "location/edit/:id", to: "location#edit", as: "edit_location"

  resources :conversations do
    resources :messages
  end
end
