class DevelopmentSkillLevel < ActiveRecord::Base
  belongs_to :development_skill
  belongs_to :skill_level
end
