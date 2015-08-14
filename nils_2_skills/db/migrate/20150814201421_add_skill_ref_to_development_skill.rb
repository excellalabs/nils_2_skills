class AddSkillRefToDevelopmentSkill < ActiveRecord::Migration
  def change
    add_reference :development_skills, :skill, index: true
  end
end
