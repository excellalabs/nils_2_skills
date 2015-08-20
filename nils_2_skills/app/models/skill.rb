class Skill < ActiveRecord::Base
  validates :skill_name, presence: true
  validates :category, presence: true

  has_many :development_skills
  has_many :skill_categories
end
