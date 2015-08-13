class AddPlanIdToDevelopmentTasks < ActiveRecord::Migration
  def change
  	change_table(:development_tasks) do |t|
	t.integer :plan_id
	end
  end
end
