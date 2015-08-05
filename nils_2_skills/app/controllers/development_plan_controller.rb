class DevelopmentPlanController < ApplicationController
  before_action :authenticate_user!

  def new
  	@development_plan = DevelopmentPlan.new
  end
  def create
  current_user.development_plans << DevelopmentPlan.new(devplan_params)
    if current_user.save
  	  redirect_to '/Dashboard'
  	else
      redirect_to new_development_plan_path
      # Flash error message - Hartl?
  	end
  end

  def edit
    @development_plan = DevelopmentPlan.find(params[:id])
  end
  def update
    @development_plan = DevelopmentPlan.find(params[:id])
    if correct_user(@development_plan.user_id)
      if @development_plan.update(devplan_params)
        # @development_plan.update_attributes(devplan_params)
        redirect_to development_plan_path
      else
        redirect_to edit_development_plan_path
        # Flash error messages
      end
    else
      redirect_to root_url
    end
  end

  def destroy
    @development_plan = DevelopmentPlan.find(params[:id])
    @development_plan.destroy
    redirect_to '/Dashboard'
  end

  def show
    @development_plan = DevelopmentPlan.find(params[:id])
  end

  def devplan_params
  	params.require(:development_plan).permit(:plan_name, :description)
  end

  def correct_user(user_id)
      #Checks if the plan was created by the current user before updating changes
      user_id == current_user.id
  end
end