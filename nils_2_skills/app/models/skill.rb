class Skill < ActiveRecord::Base
	has_many :development_skills
	validates :skill_name, presence: true
	validates :category, presence: true
end
