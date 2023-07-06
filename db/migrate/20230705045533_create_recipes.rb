class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.string :preparation_time
      t.string :cooking_time
      t.text :description
      t.boolean :public, null: false, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
