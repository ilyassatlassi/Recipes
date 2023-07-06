require 'rails_helper'

RSpec.describe 'Foods', type: :system do
  describe 'Food list index page' do
    before do
      @user = User.create!(name: 'user1', email: 'user@example.com', password: '123456')
      @food1 = Food.create!(name: 'food1', measurement_unit: 'food1 grams', price: 2, quantity: 4, user: @user)
      @food = Food.create!(name: 'food2', measurement_unit: 'food2 grams', price: 3, quantity: 4, user: @user)
      visit foods_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end

    scenario 'A food list is displayed on foods page' do
      expect(page).to have_content('food1')
      expect(page).to have_content('food2')
    end

    scenario 'Price of each food is displayed on foods page' do
      expect(page).to have_content('2')
      expect(page).to have_content('3')
    end

    scenario 'Quantity displayed on foods page' do
      expect(page).to have_content('4')
      expect(page).to have_content('4')
    end

    scenario 'A measurement unit for food is displayed on foods page' do
      expect(page).to have_content('grams')
    end

    scenario 'When I click on a remove btn, food is deleted.' do
      click_button 'Remove', id: "remove-button-#{@food1.id}"
      expect(page).to_not have_content('food1 grams')
      expect(page).to have_content('food2')
    end
  end
end
