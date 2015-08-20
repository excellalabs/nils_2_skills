class CreateSkillCategorySkills < ActiveRecord::Migration
  def change
    create_table :skill_category_skills do |t|

      t.timestamps
    end
  end
end
