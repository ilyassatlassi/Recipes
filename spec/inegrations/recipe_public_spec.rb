require 'rails_helper'

RSpec.describe 'User index page', type: :system do
  describe 'Recipe' do
    before do
      @user = User.create!(name: 'user1', email: 'user@email.com', password: '123456')
      @recipe = Recipe.create!(user_id: @user.id, name: 'New public recipe', preparation_time: 20, cooking_time: 40,
                               description: 'Recipe description', public: true)
      @recipe = Recipe.create!(user_id: @user.id, name: 'New public recipe', preparation_time: 20, cooking_time: 40,
                               description: 'Recipe description', public: false)
      visit root_path
    end

    scenario 'Public recipe is displayed on public_recipes page' do
      expect(page).to have_content('New public recipe')
    end

    scenario 'Private recipe is not displayed on public_recipes page' do
      expect(page).should have_no_content('New private recipe')
    end
  end
end
