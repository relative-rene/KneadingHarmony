Rails.application.routes.draw do
  resources :time_slots
  #  resource :calendar, only [:show], controller: :calendar
  #  get 'calendar#show'
  resource :calendar, only: [:show], controller: :calendar

  resources :users do
    resources :appointments
  end
  root to: 'welcome#index'
  #About route
  get "/about", to: "about#show", as: "about"
  #Policy route
  get "/policy", to: "policy#show", as: "policy"
  #Services
  get "/services", to: "services#index", as: "services"
  #Session routes
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create", as: "post_session"

end
