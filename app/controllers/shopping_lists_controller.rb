class ShoppingListsController < ApplicationController
  def index
    @user = current_user
    @recipes = @user.recipes.includes(:recipe_foods)
    @general_food_list = @user.foods

    @missing_foods = calculate_missing_foods
    @total_items = @missing_foods.length
    @total_price = calculate_total_price
  end

  private

  def calculate_missing_foods
    general_food_quantities = @general_food_list.group(:name).sum(:quantity)
    recipe_food_quantities = @recipes.flat_map do |recipe|
      recipe.recipe_foods.map do |rf|
        { name: rf.food.name, quantity: rf.quantity }
      end
    end

    missing_foods = []
    recipe_food_quantities.each do |food_hash|
      name = food_hash[:name]
      quantity = food_hash[:quantity]
      next unless general_food_quantities[name].to_i < quantity

      missing_food = {
        name:,
        quantity: quantity - general_food_quantities[name].to_i,
        price: calculate_food_price(name)
      }
      missing_foods << missing_food
    end

    missing_foods
  end

  def calculate_food_price(food_name)
    food = @general_food_list.find_by(name: food_name)
    food.present? && food.price.present? ? food.price.to_f : 0
  end

  def calculate_total_price
    @missing_foods.sum { |missing_food| missing_food[:price] * missing_food[:quantity] }
  end
end
