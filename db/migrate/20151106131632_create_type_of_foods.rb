class CreateTypeOfFoods < ActiveRecord::Migration
  def change
    create_table :type_of_foods do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
