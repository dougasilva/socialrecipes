Rails.application.routes.draw do
  root 'recipes#index'
  resources :recipes, only: [:new, :show, :create, :index]
  resources :kitchens, only: [:new, :show, :create, :index]
  resources :type_of_foods, only: [:new, :show, :create, :index]
  resources :preferences, only: [:new, :show, :create, :index]
end
