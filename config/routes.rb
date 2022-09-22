Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  resources :recipes, except: :update
  resources :foods, except: :update
     resources :foods, only: [:index, :show, :new, :create, :destroy]

  # Defines the root path route ("/")
  root "recipes#public"
end
