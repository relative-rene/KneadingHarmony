Rails.application.routes.draw do


  root to: 'users#index'
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

  #Time_Slot
  get "/time_slots", to: "time_slots#index", as: "time_slots"
  get "/time_slots/new", to: "time_slots#new", as: "new_time_slot"
  post "/time_slots", to: "time_slots#create", as: "create_time_slot"
  get "/time_slots/:id", to: "time_slots#show", as: "time_slot"
  get "/time_slots/:id/edit", to: "time_slots#edit", as: "edit_time_slot"
  patch "/time_slots/:id", to: "time_slots#update", as: "update_time_slot"
  delete "/time_slots/:id", to: "time_slots#destroy", as: "delete_time_slot"


  #Appointment
  get '/time_slots/:id/appointments/new', to: "appointments#new", as: "new_appointment"
  post '/time_slots/:id/appointments/create', to: "appointments#create", as: "create_appointment"
  get '/time_slots/:id/appointments/:id', to: "appointments#show", as: "appointment"
  get '/appointments/:id/edit', to: "appointments#edit", as: "edit_appointment"
  patch '/appointments/:id', to: "appointments#update"
  delete '/time_slots/:time_slot_id/appointments/:appointment_id', to: "appointments#destroy", as: "delete_appointment"

  #About route
  get "/about", to: "about#show", as: "about"
  #Policy route
  get "/policy", to: "policy#show", as: "policy"
  #Services
  get "/services", to: "services#index", as: "services"

end
