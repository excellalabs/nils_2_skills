class AdminController < ApplicationController
  before_action :authenticate_user!

  def skill_category  	
  	@categories = { :skill_category => SkillCategory.new, :skill_categories => SkillCategory.all, :submit_btn_text => "Add New Category", :path => admin_create_skill_category_path }
  end

  def create_skill_category
    @skill_category = SkillCategory.new(skill_category_params)
    @skill_category.save
    redirect_to admin_skill_category_path  	
  end

  def edit_skill_category
  	@categories = { :skill_category => SkillCategory.find(params[:id]), :skill_categories => SkillCategory.all, :submit_btn_text => "Update Category", :path => admin_update_skill_category_path }
    redirect_to admin_skill_category_path
  end

  def update_skill_category
    @skill_category = SkillCategory.find(params[:id])
    @skill_category.update
    redirect_to admin_skill_category_path  
  end

  def destroy_skill_category
    @skill_category = SkillCategory.find(params[:id])
    @skill_category.destroy
    redirect_to admin_skill_category_path 
  end

  private

    def skill_category_params
  	  params.require(:skill_category).permit(:category_name, :description)
    end

end