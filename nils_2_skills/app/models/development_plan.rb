class DevelopmentPlan < ActiveRecord::Base
	belongs_to :user
	has_many :development_tasks
	validates :plan_name, presence: true, length: { maximum: 50 }
	validates :description, presence: true
end