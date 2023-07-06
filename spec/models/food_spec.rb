require 'rails_helper'

describe Food, type: :model do
  before :each do
    @user = User.create(name: 'Test', email: 'test2@example.com', password: 'password')
    @test_food = Food.create(user: @user, name: 'test food', measurement_unit: 'unit', price: 10, quantity: 2)
  end

  it 'Food model field should be equal to test food' do
    expect(@test_food.name).to eq('test food')
    expect(@test_food.measurement_unit).to eq('unit')
    expect(@test_food.price).to eq(10.0)
    expect(@test_food.quantity).to eq(2)
  end
end