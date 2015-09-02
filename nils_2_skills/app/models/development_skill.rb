class DevelopmentSkill < ActiveRecord::Base
  attr_accessor :current_skill_level, :desired_skill_level

  belongs_to :skill
  belongs_to :user
  has_many :development_tasks
  belongs_to :development_plan

  has_many :development_skill_levels
  has_many :skill_levels, through: :development_skill_levels
end
