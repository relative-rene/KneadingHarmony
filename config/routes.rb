Rails.application.routes.draw do


  root to: 'welcome#index'
    #User routes
  get "/users", to: "users#index", as: "users"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create", as: "create_user"
  get "/users/:id", to: "users#show", as: "user"
  get "users/:id/edit", to: "users#edit", as:"user_edit"
  patch "/users/:id", to: "users#update", as: "update_user"
  delete '/users/:id', to: "users#destroy", as: "destroy_user"

  #Sessions
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"

  #About route
  get "/about", to: "about#show", as: "about"
  #Policy route
  get "/policy", to: "policy#show", as: "policy"
  #Services
  get "/services", to: "services#index", as: "services"

end
