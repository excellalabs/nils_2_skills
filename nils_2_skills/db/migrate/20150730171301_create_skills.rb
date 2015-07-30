class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :skill_name
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
