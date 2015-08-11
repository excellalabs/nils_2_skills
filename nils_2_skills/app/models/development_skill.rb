class DevelopmentSkill < ActiveRecord::Base
	belongs_to :skill
	has_many :development_tasks
end
