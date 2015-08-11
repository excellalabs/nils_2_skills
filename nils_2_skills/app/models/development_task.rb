class DevelopmentTask < ActiveRecord::Base
	has_one :development_skill
	validates :task_name, presence: true, length: { maximum: 50 }
end
