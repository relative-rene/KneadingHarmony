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

  #Appointment
  get '/users/:id/appointments/new', to: "appointments#new", as: "new_appointment"
  post '/users/:id/appointments/create', to: "appointments#create", as: "create_appointment"
  get '/appointments/:id/edit', to: "appointments#edit", as: "edit_appointment"
  patch '/appointments/:id', to: "appointments#update"
  delete '/timeslots/:timeslot_id/appointments/:appointment_id', to: "appointments#destroy", as: "delete_appointment"

  #Timeslot
  get "/timeslots", to: "timeslots#index", as: "timeslots"
  get "/timeslots/new", to: "timeslots#new", as: "new_timeslot"
  post "/timeslots", to: "timeslots#create", as: "create_timeslot"
  get "/timeslots/:id", to: "timeslots#show", as: "timeslot"
  get "/timeslots/:id/edit", to: "timeslots#edit", as: "edit_timeslot"
  patch "/timeslots/:id", to: "timeslots#update", as: "update_timeslot"
  delete "/timeslots/:id", to: "timeslots#destroy", as: "delete_timeslot"


  #About route
  get "/about", to: "about#show", as: "about"
  #Policy route
  get "/policy", to: "policy#show", as: "policy"
  #Services
  get "/services", to: "services#index", as: "services"

end
