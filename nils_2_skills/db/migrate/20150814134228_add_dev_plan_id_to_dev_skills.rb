class AddDevPlanIdToDevSkills < ActiveRecord::Migration
  def change
  	change_table(:development_skills) do |t|
	t.integer :development_plan_id
    end
  end
end
