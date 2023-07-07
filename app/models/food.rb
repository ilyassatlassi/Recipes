class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :recipe_foods, class_name: 'RecipeFood', foreign_key: 'food_id', dependent: :destroy
  has_many :recipe, through: :recipe_foods

  attribute :measurement_unit, :string
  attribute :price, :decimal, precision: 8, scale: 2

  validates :name, presence: true, length: { maximum: 50 }
end
