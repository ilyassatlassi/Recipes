require 'rails_helper'

describe Recipe, type: :model do
  before :each do
    @user = User.create(name: 'Test', email: 'test2@example.com', password: 'password')
    @recipe = Recipe.create(user: @user, name: 'test recipe', preparation_time: 1, cooking_time: 10,
                            description: 'test test')
  end

  it 'Recipe model field should be equal to test recipe' do
    expect(@recipe.name).to eq('test recipe')
    expect(@recipe.preparation_time.to_i).to eq(1)
    expect(@recipe.cooking_time.to_i).to eq(10)
    expect(@recipe.description).to eq('test test')
  end
end
