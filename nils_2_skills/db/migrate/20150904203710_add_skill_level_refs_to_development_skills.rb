class AddSkillLevelRefsToDevelopmentSkills < ActiveRecord::Migration
  def change
  	add_column :development_skills, :desired_skill_level_id, :integer
  	add_column :development_skills, :current_skill_level_id, :integer
  end
end
