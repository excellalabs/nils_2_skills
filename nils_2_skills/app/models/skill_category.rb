class SkillCategory < ActiveRecord::Base
  validates :category_name, presence: true
end
