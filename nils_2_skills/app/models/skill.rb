class Skill < ActiveRecord::Base
	has_many :development_skills
	has_many :skills_to_categories
  	has_many :skill_categories , through :skills_to_categories
	validates :skill_name, presence: true
	validates :category, presence: true
end
