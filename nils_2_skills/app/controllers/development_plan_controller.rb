class DevelopmentPlanController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user

  def new
  	@development_plan = DevelopmentPlan.new
  end
  def create
    current_user.development_plans << DevelopmentPlan.new(devplan_params)
  	if current_user.save
  	  redirect_to '/Dashboard'
  	else
      redirect_to development_plan_new_path
  	  #redirect_to '/development_plan/new'
      # Flash error message - Hartl?
  	end
  end

  def destroy
    @development_plan.destroy
    redirect_to '/Dashboard'
  end

  def edit
    @development_plan = DevelopmentPlan.find(params[:id])
  end
  def update
    @development_plan = DevelopmentPlan.find(params[:id])
    if  @development_plan.update_attributes(devplan_params)
      redirect_to '/Dashboard'
    else
      redirect_to edit_development_plan_path
      # Flash error messages
    end

  end

  def devplan_params
  	params.require(:development_plan).permit(:plan_name, :description)
  end

  def correct_user
      @development_plan = current_user.development_plans.find_by(id: params[:id])
  end
end