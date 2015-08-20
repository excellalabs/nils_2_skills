class DevelopmentSkill < ActiveRecord::Base
  belongs_to :skill
  belongs_to :user
  has_many :development_tasks
  has_many :development_plans, through: :development_plan_skills
end
