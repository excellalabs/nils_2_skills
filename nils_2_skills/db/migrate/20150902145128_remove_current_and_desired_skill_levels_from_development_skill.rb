class RemoveCurrentAndDesiredSkillLevelsFromDevelopmentSkill < ActiveRecord::Migration
  def change
  	remove_column :development_skills, :current_skill_level
  	remove_column :development_skills, :desired_skill_level
  end
end
