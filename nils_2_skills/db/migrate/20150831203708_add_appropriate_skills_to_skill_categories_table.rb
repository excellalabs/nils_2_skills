class AddAppropriateSkillsToSkillCategoriesTable < ActiveRecord::Migration
  def change
    drop_table :skill_categories_skills

    create_table :skills_skill_categories do |t|
        t.belongs_to :skill, index: true
        t.belongs_to :skill_category, index: true
        t.timestamps
  end
  end
end
