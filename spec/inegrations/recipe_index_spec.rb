require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  describe 'recipe index page' do
    before do
      @user = User.create(name: 'Test', email: 'test2@example.com', password: 'password')
      @recipe = Recipe.create(user: @user, name: 'test recipe1', preparation_time: 1, cooking_time: 10,
                              description: 'test test1')
      Recipe.create(user: @user, name: 'test recipe2', preparation_time: 1, cooking_time: 10, description: 'test test2')
      visit recipes_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end
    it 'Recipes list' do
      expect(page).to have_content('Test Recipe1')
      expect(page).to have_content('Test Recipe2')
    end
    it 'Recipes description' do
      expect(page).to have_content('test test1')
      expect(page).to have_content('test test2')
    end
    it 'When I click on a recipe, I am redirected to that recipe show page.' do
      click_link 'test recipe1'
      expect(page).to have_current_path(recipe_path(@recipe))
    end
  end
end
