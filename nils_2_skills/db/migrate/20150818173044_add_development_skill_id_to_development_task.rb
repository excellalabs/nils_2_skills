class AddDevelopmentSkillIdToDevelopmentTask < ActiveRecord::Migration
  def change
  	add_reference :development_tasks, :development_skill, index: true
  end
end
