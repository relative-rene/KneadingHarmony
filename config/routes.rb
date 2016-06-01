Rails.application.routes.draw do
  #  resource :calendar, only [:show], controller: :calendar
  #  get 'calendar#show'

    resources :users do
      resources :appointments
    end

  root 'welcome#index'
end
