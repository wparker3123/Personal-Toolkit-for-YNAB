Rails.application.routes.draw do
  get 'reports/category_overview', to: 'reports#category_overview'
  get 'reports/fetch_prev_category_assignments', to: 'reports#fetch_prev_category_assignments'
  get 'home', to: 'pages#home', as: 'home'
  root 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :BudgetCategory, only: [:home]
  # Defines the root path route ("/")
  # root "posts#index"
end
