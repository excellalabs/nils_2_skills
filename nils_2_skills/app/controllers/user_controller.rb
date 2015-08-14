class UserController < ApplicationController
  before_action :authenticate_user!

  def Dashboard
  end

  def Profile
  end

  def MySkills
  	@development_skills = current_user.development_skills.all 	
  end
  
end
