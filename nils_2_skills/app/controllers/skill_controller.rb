class SkillController < ApplicationController
  def new
  	@skill = Skill.new
  end

  def create
	  	if @skill.save
	  	  redirect_to 'Dashboard'
	  	else
	      redirect_to skill_new_path
	  end
  end

  def destroy
  	@skill.destroy
  	redirect_to 'Dashboard'
  end

  def edit
  end
end
