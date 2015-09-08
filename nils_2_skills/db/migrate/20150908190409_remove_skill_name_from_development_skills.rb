class RemoveSkillNameFromDevelopmentSkills < ActiveRecord::Migration
  def change
  	remove_column :development_skills, :skill_name, :string
  end
end
