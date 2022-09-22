Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  resources :recipes, except: :update do 
    resources :recipe_foods
  end
  resources :foods, except: :update

  # Defines the root path route ("/")
  root "recipes#public"
end
