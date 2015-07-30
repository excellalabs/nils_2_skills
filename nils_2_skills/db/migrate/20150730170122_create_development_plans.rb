class CreateDevelopmentPlans < ActiveRecord::Migration
  def change
    create_table :development_plans do |t|
      t.string :plan_name
      t.text :description

      t.timestamps
    end
  end
end
