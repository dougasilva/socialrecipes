class AddAttachmentFotoToRecipes < ActiveRecord::Migration
  def self.up
    change_table :recipes do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :recipes, :foto
  end
end
