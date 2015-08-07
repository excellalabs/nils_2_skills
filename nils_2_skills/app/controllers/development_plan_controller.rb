class DevelopmentPlanController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_dev_plan, only: [:show, :edit, :update, :destroy]

  def index
    @development_plans = DevelopmentPlan.all
  end

  def show
  end

  def new
  	@development_plan = DevelopmentPlan.new
  end

  def edit
  end

  def create
  current_user.development_plans << DevelopmentPlan.new(devplan_params)
    if current_user.save
  	  redirect_to :Dashboard
  	else
      #Render sends object back to form as opposed to redirect, which issues a new request
      redirect_to new_development_plan_path
      # Flash error message - Hartl?
  	end
  end

  def update
    if correct_user(@development_plan.user_id)
      if @development_plan.update(devplan_params)
        # @development_plan.update_attributes(devplan_params)
        redirect_to development_plan_path
      else
        render 'edit'
        # Flash error messages
      end
    else
      #User cannot edit plans they did not create
      redirect_to root_url
    end
  end

  def destroy
    if correct_user(@development_plan.user_id)
      @development_plan.destroy
      redirect_to :Dashboard
      #Handle failed deletes?
    else
      #User cannot delete plans they did not create
      redirect_to root_url
    end
  end

  private
    def devplan_params
    	params.require(:development_plan).permit(:plan_name, :description)
    end

    def correct_user(user_id)
        #Checks if the plan was created by the current user before updating changes
        user_id == current_user.id
    end

    def set_dev_plan
      @development_plan = DevelopmentPlan.find(params[:id])
    end
end