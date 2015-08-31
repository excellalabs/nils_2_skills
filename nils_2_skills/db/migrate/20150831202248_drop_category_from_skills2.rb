class DropCategoryFromSkills2 < ActiveRecord::Migration
  def change
    remove_column :skills, :skill_categories_id
    add_reference :skills, :skill_category, index: true
  end
end
