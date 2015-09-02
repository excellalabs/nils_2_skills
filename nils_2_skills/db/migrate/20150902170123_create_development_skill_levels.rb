class CreateDevelopmentSkillLevels < ActiveRecord::Migration
  def change
    create_table :development_skill_levels do |t|
      t.belongs_to :development_skill
      t.belongs_to :skill_level
      t.boolean :is_current
      t.timestamps
    end
  end
end
