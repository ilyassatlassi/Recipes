Rails.application.routes.draw do
  get 'recipe_foods/new'
  get 'recipe_foods/create'
  get 'recipe_foods/destroy'
  devise_for :users
  root "recipes#public"
  resources :recipes, only: [:index, :show, :new, :create, :update, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
  resources :foods

end
