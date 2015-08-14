class AddUserRefToDevelopmentSkill < ActiveRecord::Migration
  def change
    add_reference :development_skills, :user, index: true
  end
end
