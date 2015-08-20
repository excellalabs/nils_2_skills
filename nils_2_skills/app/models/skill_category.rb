class SkillCategory < ActiveRecord::Base
  validates :category_name, presence: true, uniqueness: true
  has_and_belongs_to_many :skills
end
