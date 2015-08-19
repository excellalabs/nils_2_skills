class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :development_plans
  has_many :development_skills

  def my_skills
    self.development_skills.where(completed: true).all.uniq
  end

end
