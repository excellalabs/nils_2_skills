class SkillToCategory < ActiveRecord::Base
  belongs_to :skill
  belongs_to :skill_category
end