require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  describe 'recipe show page' do
    before :each do
      @user = User.create(name: 'Test', email: 'test2@example.com', password: 'password')
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(@user)
      @recipe = Recipe.create(user: @user, name: 'test recipe1', preparation_time: 1, cooking_time: 10,
                              description: 'test test1')
      visit recipe_path(@recipe)
    end
    it 'Recipe content' do
      expect(page).to have_content('test recipe1')
      expect(page).to have_content("Preparation time: #{@recipe.preparation_time} hours")
      expect(page).to have_content("Cooking time: #{@recipe.cooking_time} hours")
    end
    it 'Recipes description' do
      expect(page).to have_content('test test1')
    end
    it 'When I click on a shopping list btn, I am redirected to shopping list page page.' do
      click_button 'Generate shopping list'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      expect(page).to have_current_path(generate_shopping_list_path)
    end
    it 'When I click on a Add Inrgredient btn, I am redirected to Add ingredient page.' do
      click_button 'Add Ingredient'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      expect(page).to have_current_path(new_recipe_recipe_food_path(@recipe))
    end
    it 'click on a toggle btn.' do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      visit recipe_path(@recipe)
      check('toggle-btn')
      expect(page).to have_checked_field('toggle-btn')
    end
  end
end
