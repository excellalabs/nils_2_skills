class SkillLevel < ActiveRecord::Base
  validates :level, presence: true
  validates :level, uniqueness: true

  has_many :development_skill_levels
  has_many :development_skills, through: :development_skill_levels
end
