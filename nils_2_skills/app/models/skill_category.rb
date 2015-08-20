class SkillCategory < ActiveRecord::Base
  validates :category_name, presence: true
  validates :category_name, uniqueness: true
  has_many :skills, through: :skill_category_skills
end
