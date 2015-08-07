class AssociateSkillToSkillCategory < ActiveRecord::Migration
	def change
	    create_table :skill_to_categories do |t|
	      t.belongs_to :skill, index: true
	      t.belongs_to :skill_category, index: true
	      t.timestamps
	    end
  	end
end
