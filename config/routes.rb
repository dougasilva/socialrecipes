Rails.application.routes.draw do
  resources :recipes, only: [:new, :show, :create, :index]
  resources :kitchens, only: [:new, :show, :create, :index]
end
