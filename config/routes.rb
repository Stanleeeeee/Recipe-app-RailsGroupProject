Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :recipes, :except => [:update]
    resources :foods, :except => [:update]
  end
  # Defines the root path route ("/")
  root "users#index"
end
