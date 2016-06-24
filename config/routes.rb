Rails.application.routes.draw do

# USERS
  resources :users
  get "users/:id/posts", to: "users#posts"
  get "/", to: "users#index", as: "homepage"
  get "/users/:id", to: "users#show"

# POSTS
  resources :posts

# SESSIONS
  get "/signin", to: "sessions#new", as: "signin"
  post "/sessions", to: "sessions#create"
  delete "/logout", to:"sessions#delete"

# CITIES
  resources :cities do
    resources :posts
  end
  get "cities/:id/posts", to: "cities#posts"


end
