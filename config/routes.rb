Rails.application.routes.draw do
  resources :users do
    resources :appointments
  end
  resources :time_slots


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
  #Appointment & TimeSlot
  get "/appointments/:id/time_slots/new", to: "time_slots#new", as: "new_time_slots"
  post "/appointments/:id/time_slots", to: "time_slots#create", as: "create_time_slots"
end
