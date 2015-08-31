class DropCategoryFromSkills < ActiveRecord::Migration
  def change
    remove_column :skills, :category
    add_reference :skills, :skill_categories, index: true
  end
end
