Rails.application.routes.draw do

  resources :users
  resource :calendar, only [:show], controller: :calendar
  get 'calendar#show'
end 
  resources :users do
    resources :appointments

  get 'welcome/index'

  root 'welcome#index'

end
