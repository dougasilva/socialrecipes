class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :kitchen
      t.string :type_of_food
      t.string :preference
      t.integer :amount
      t.integer :time_preparation
      t.string :difficulty
      t.text :ingredients
      t.text :preparation

      t.timestamps null: false
    end
  end
end
