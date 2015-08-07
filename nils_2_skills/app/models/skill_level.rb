class SkillLevel < ActiveRecord::Base
  validates :level, presence: true
end
