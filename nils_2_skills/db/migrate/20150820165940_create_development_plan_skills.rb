class CreateDevelopmentPlanSkills < ActiveRecord::Migration
  def change
    create_table :development_plan_skills do |t|

      t.timestamps
    end
  end
end
