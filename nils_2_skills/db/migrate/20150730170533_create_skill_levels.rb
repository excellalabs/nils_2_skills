class CreateSkillLevels < ActiveRecord::Migration
  def change
    create_table :skill_levels do |t|
      t.string :level
      t.text :description

      t.timestamps
    end
  end
end
