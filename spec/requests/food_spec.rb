require 'rails_helper'

RSpec.describe Food, type: :request do
  include Devise::Test::IntegrationHelpers
  describe 'GET /foods' do
    before do
      @user = User.create(name: 'Test', email: 'test2@example.com', password: 'password')
      @food = Food.create!(name: 'food2', measurement_unit: 'food2 grams', price: 3, quantity: 4, user: @user)
      sign_in @user
    end
    it 'should responce with success.' do
      get '/foods'
      expect(response).to have_http_status(:success)
    end
    it 'should responce with correct status' do
      get '/foods'
      expect(response.status).to eq(200)
    end
    it 'should render correct template' do
      get '/foods'
      expect(response).to render_template('index')
    end
  end

  describe 'POST :create' do
    before do
      @user = User.create(name: 'Test', email: 'test2@example.com', password: 'password')
      sign_in @user
    end
    it 'creates a new recipe' do
      food_attributes = { name: 'food2', measurement_unit: 'food2 grams', price: 3, quantity: 4 }

      post '/foods', params: { food: food_attributes }

      expect(response.status).to eq(302)
      expect(Food.last.name).to eq('food2')
      expect(Food.last.measurement_unit).to eq('food2 grams')
    end
  end

  describe 'DELETE :destroy' do
    before do
      @user = User.create(name: 'Test', email: 'test2@example.com', password: 'password')
      sign_in @user
      @food = Food.create!(name: 'food2', measurement_unit: 'food2 grams', price: 3, quantity: 4, user: @user)
    end
    it 'delete recipe' do
      delete food_path(@food)

      expect(response.status).to eq(302)
      expect(Food.exists?(@food.id)).to be_falsey
      expect(response).to redirect_to(foods_path)
    end
  end
end
