class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity,  null: false, default: 0
      t.references :recipe, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
