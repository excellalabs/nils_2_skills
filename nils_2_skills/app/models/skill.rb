class Skill < ActiveRecord::Base
	has_many :development_skills
	has_many :skill_categories
	belongs_to :skill_category
	validates :skill_name, presence: true
	validates :category, presence: true
end
