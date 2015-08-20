class SkillCategorySkills < ActiveRecord::Base
  belongs_to :skill_category
  belongs_to :skill
end
