Rails.application.routes.draw do
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

  #time_slots
  #Events
get "/time_slots", to: "time_slots#index", as: "time_slots"
get "/time_slots/new", to: "time_slots#new", as: "new_time_slot"
post "/time_slots", to: "time_slots#create", as: "create_time_slot"
get "/time_slots/:id", to: "time_slots#show", as: "time_slot"
get "/time_slots/:id/edit", to: "time_slots#edit", as: "edit_time_slot"
patch "/time_slots/:id", to: "time_slots#update", as: "update_time_slot"
delete "/time_slots/:id", to: "time_slots#destroy", as: "delete_time_slot"

  #Appointment & TimeSlot
  get "/appointments/:id/time_slots/new", to: "time_slots#new", as: "new_time_slots"
  post "/appointments/:id/time_slots", to: "time_slots#create", as: "create_time_slots"
end
