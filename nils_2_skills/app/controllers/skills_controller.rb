class SkillsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  def new
  	@skill = Skill.new
  end

  def show
  end

  def index
    @skills = Skill.all
  end

  def create
  	@skill = Skill.new(skill_params)
	  	if @skill.save
	  	  redirect_to skills_path
	  	else
	      redirect_to skill_new_path
	  end
  end

  def destroy
  	@skill.destroy
  	redirect_to skills_path
  end

  def edit
  end

  def update
    @skill.update(skill_params)
    redirect_to skills_path
  end

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
  	params.require(:skill).permit(:skill_name, :category, :description)
  end
end
