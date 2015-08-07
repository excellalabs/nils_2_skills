class AddSkillIdToDevelopmentSkills < ActiveRecord::Migration
  def change
  	  	change_table(:development_skills) do |t|
  		t.integer :skill_id
  	end
  end
end
