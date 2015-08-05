class DevelopmentSkillsController < ApplicationController
  before_action :set_development_skill, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @development_skills = DevelopmentSkill.all
    respond_with(@development_skills)
  end

  def show
    respond_with(@development_skill)
  end

  def new
    @development_skill = DevelopmentSkill.new
    respond_with(@development_skill)
  end

  def edit
  end

  def create
    @development_skill = DevelopmentSkill.new(development_skill_params)
    @development_skill.save
    respond_with(@development_skill)
  end

  def update
    @development_skill.update(development_skill_params)
    respond_with(@development_skill)
  end

  def destroy
    @development_skill.destroy
    respond_with(@development_skill)
  end

  private
    def set_development_skill
      @development_skill = DevelopmentSkill.find(params[:id])
    end

    def development_skill_params
      params.require(:development_skill).permit(:skill_name, :desired_skill_level, :notes, :completed, :percent_complete, :current_skill_level)
    end
end
