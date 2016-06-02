Rails.application.routes.draw do
  #  resource :calendar, only [:show], controller: :calendar
  #  get 'calendar#show'
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

  #calendar
  get "/calendar", to: "calendar#show", as: "calendar"

end
