class SkillLevel < ActiveRecord::Base
  validates :level, presence: true
  validates :level, uniqueness: true
  has_many :desired_skill_levels, :foreign_key => "desired_skill_level_id", :class_name => "DevelopmentSkill"
  has_many :current_skill_levels, :foreign_key => "current_skill_level_id", :class_name => "DevelopmentSkill"
end
