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
    render "admin/skill_category"
  end

  def update_skill_category
    @skill_category = SkillCategory.find(params["skill_category"]["id"])
    @skill_category.category_name = params["skill_category"]['category_name']
    @skill_category.description = params["skill_category"]['description']
    @skill_category.save!
    redirect_to admin_skill_category_path  
  end

  def destroy_skill_category
    puts "params id: " + params[:id].to_s
    @skill_category = SkillCategory.find(params[:id])
    @skill_category.destroy
    redirect_to admin_skill_category_path 
  end

  private

    def skill_category_params
  	  params.require(:skill_category).permit(:category_name, :description)
    end

end