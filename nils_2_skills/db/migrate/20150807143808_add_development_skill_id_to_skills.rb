class AddDevelopmentSkillIdToSkills < ActiveRecord::Migration
  def change
  	change_table(:skills) do |t|
  		t.integer :development_skill_id
  	end
  end
end
