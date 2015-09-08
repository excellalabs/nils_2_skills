class DevelopmentSkill < ActiveRecord::Base
  belongs_to :skill
  belongs_to :user
  belongs_to :current_skill_level, :class_name => "SkillLevel"
  belongs_to :desired_skill_level, :class_name => "SkillLevel"
  has_many :development_tasks
  has_and_belongs_to_many :development_plans
end
