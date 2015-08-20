class Skill < ActiveRecord::Base
  has_many :development_skills
  has_and_belongs_to_many :skill_categories
  validates :skill_name, presence: true
  validates :category, presence: true
end
