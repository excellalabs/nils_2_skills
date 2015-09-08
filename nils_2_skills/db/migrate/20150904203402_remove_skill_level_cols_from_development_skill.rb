class RemoveSkillLevelColsFromDevelopmentSkill < ActiveRecord::Migration
  def change
  	remove_column :development_skills, :desired_skill_level, :string
  	remove_column :development_skills, :current_skill_level, :string
  end
end
