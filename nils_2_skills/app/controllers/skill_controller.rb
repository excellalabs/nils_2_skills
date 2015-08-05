class SkillController < ApplicationController
  def new
  	@skill = Skill.new
  end

  def create
  	@skill = Skill.new(skill_params)
	  	if @skill.save
	  	  redirect_to :Dashboard
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

  def skill_params
  	params.require(:skill).permit(:skill_name, :category, :description)
  end
end
