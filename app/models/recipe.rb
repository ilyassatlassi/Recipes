class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_food, dependent: :destroy
  has_many :food, through: :recipe_food

  validates :name, presence: true, length: { maximum: 100 }
end
