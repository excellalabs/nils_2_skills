class SkillCategory < ActiveRecord::Base
  validates :category_name, presence: true
  validates :category_name, uniqueness: true
  has_many :skills_to_categories
  has_many :skills, through: :skills_to_categories
end
