class DevelopmentSkill < ActiveRecord::Base
	belongs_to :skill
	has_many :development_tasks
	has_and_belongs_to_many :development_plans
end
