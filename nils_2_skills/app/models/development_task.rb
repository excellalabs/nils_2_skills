class DevelopmentTask < ActiveRecord::Base
  belongs_to :development_skill
  validates :task_name, presence: true, length: { maximum: 50 }
  validates :development_skill_id, presence: true
  validate :completion_date_is_after_start_date
end

private

def completion_date_is_after_start_date
  return if completion_date.blank? || start_date.blank?

  errors.add(:completion_date, 'cannot be before the start date') if completion_date < start_date
end
