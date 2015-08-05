class CreateDevelopmentTasks < ActiveRecord::Migration
  def change
    create_table :development_tasks do |t|
      t.string :task_name
      t.text :details
      t.date :start_date
      t.date :completion_date
      t.boolean :completed

      t.timestamps
    end
  end
end
