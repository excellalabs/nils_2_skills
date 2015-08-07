class SkillCategory < ActiveRecord::Base
  has_many :skills_to_categories
  has_many :skills, through :skills_to_categories
end
