class SkillLevel < ActiveRecord::Base
  validates :level, presence: true
  validates :level, uniqueness: true
end
