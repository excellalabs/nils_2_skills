class Skill < ActiveRecord::Base
  #validates :skill_id, presence: true
  #validates :category, presence: true

  has_many :development_skills
  has_and_belongs_to_many :skill_categories
end
