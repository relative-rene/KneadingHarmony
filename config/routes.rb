Rails.application.routes.draw do
  resources :users do
    resources :appointments
  end
  get 'welcome/index'

  root 'welcome#index'

end
