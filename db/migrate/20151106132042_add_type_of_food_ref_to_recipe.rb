class AddTypeOfFoodRefToRecipe < ActiveRecord::Migration
  def change
    add_reference :recipes, :type_of_food, index: true, foreign_key: true
  end
end
