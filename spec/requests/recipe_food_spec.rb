require 'rails_helper'

RSpec.describe RecipeFood, type: :request do
  include Devise::Test::IntegrationHelpers
  describe 'POST :create' do
    before do
      @user = User.create(name: 'Test', email: 'test2@example.com', password: 'password')
      sign_in @user
      @recipe = Recipe.create(user: @user, name: 'test recipe',
                              preparation_time: 1,
                              cooking_time: 10,
                              description: 'test description')
      @test_food = Food.create(user: @user, name: 'test food', measurement_unit: 'unit', price: 10, quantity: 2)
    end
    it 'creates a new recipe_food' do
      recipe_attributes = { quantity: 20, food_id: @test_food.id }

      post recipe_recipe_foods_path(@recipe), params: { recipe_food: recipe_attributes }

      expect(response.status).to eq(302)
      expect(RecipeFood.last.quantity).to eq(20)
      expect(RecipeFood.last.recipe).to eq(@recipe)
      expect(RecipeFood.last.food).to eq(@test_food)
    end
  end

  describe 'DELETE :update' do
    before do
      @user = User.create(name: 'Test', email: 'test2@example.com', password: 'password')
      sign_in @user
      @recipe = Recipe.create(user: @user, name: 'test recipe', preparation_time: 1, cooking_time: 10,
                              description: 'test description')
      @test_food = Food.create(user: @user, name: 'test food', measurement_unit: 'unit', price: 10, quantity: 2)
      @recipe_food = RecipeFood.create(quantity: 10, food: @test_food, recipe: @recipe)
    end
    it 'delete recipe_food' do
      delete recipe_recipe_food_path(@recipe, @recipe_food)

      expect(response.status).to eq(303)
      expect(RecipeFood.exists?(@recipe_food.id)).to be_falsey
      expect(response).to redirect_to(recipe_path(@recipe))
    end
  end
end
