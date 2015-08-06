class DevelopmentTask < ActiveRecord::Base
	#belongs_to 
	validates :task_name, presence: true, length: { maximum: 50 }
end
