# Rails.application.routes.draw do
#   get 'shopping_lists/index'
#   get 'recipe_foods/new'
#   get 'recipe_foods/create'
#   get 'recipe_foods/destroy'
#   devise_for :users
#   root "recipes#public"
#   resources :recipes, only: [:index, :show, :new, :create, :update, :destroy] do
#     resources :recipe_foods, only: [:new, :create, :destroy]
#   end
#   resources :foods

# end
Rails.application.routes.draw do
  devise_for :users
  get "recipes/public", to: "recipes#public", as: "public_recipes"

  resources :users, only: [:show]

  resources :foods, except: [:update]
  resources :recipes, except: [:update] do
    resources :foods, only: [:new, :create, :destroy]
    resources :recipe_foods, only: [:new, :create, :destroy]
    patch 'toggle_public', on: :member
  end

  # resources :public_recipes, except: [:update]

  resources :shopping_lists, only: [:index]

  root 'recipes#public'
end
