class CreateSkillCategories < ActiveRecord::Migration
  def change
    create_table :skill_categories do |t|
      t.string :category_name
      t.text :description

      t.timestamps
    end
  end
end
