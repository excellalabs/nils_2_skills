class LinkSkillsToCategories < ActiveRecord::Migration
  def change
  	drop_table :skill_to_categories

  	create_table :skill_categories_skills do |t|
	      t.belongs_to :skill, index: true
	      t.belongs_to :skill_category, index: true
	      t.timestamps
	end
  end
end
