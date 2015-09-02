class DevelopmentSkillsController < ApplicationController
  before_action :authenticate_user!
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
    @skills = Skill.all
    @skill_levels = SkillLevel.all
    respond_with(@development_skill)
  end

  def edit
    @skills = Skill.all
    @skill_levels = SkillLevel.all
  end

  def create
    @development_skill = DevelopmentSkill.new(development_skill_params)
    @development_skill.user = current_user
    @development_skill.development_skill_levels << current_skill
    @development_skill.development_skill_levels << desired_skill
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
    params.require(:development_skill).permit(:skill_id, :notes, :completed, :percent_complete, :development_plan_id)
  end

  def current_skill
    create_development_skill_level 'current_skill_level', true
  end

  def desired_skill
    create_development_skill_level 'desired_skill_level', false
  end

  def create_development_skill_level(field, is_current_skill)
    DevelopmentSkillLevel.new(is_current: is_current_skill, skill_level_id: params['development_skill'][field])
  end
end
