class DevelopmentPlanSkills < ActiveRecord::Base
  belongs_to :development_plan
  belongs_to :development_skill
end
