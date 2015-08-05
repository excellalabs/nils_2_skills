class CreateDevelopmentSkills < ActiveRecord::Migration
  def change
    create_table :development_skills do |t|
      t.string :skill_name
      t.string :desired_skill_level
      t.text :notes
      t.boolean :completed
      t.float :percent_complete
      t.string :current_skill_level

      t.timestamps
    end
  end
end
