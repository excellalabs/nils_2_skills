class SkillCategory < ActiveRecord::Base
  has_many :skills
  has_many :development_skills, :through => :skills
end
