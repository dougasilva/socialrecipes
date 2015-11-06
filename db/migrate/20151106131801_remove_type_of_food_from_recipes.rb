class RemoveTypeOfFoodFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :type_of_food, :string
  end
end
