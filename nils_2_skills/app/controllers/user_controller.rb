class UserController < ApplicationController
  before_action :authenticate_user!

  def Dashboard
  end

  def Profile
  end

  def MySkills
    @my_skills = current_user.my_skills
  end
end
