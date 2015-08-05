class DevelopmentTasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_development_task, only: [:show, :edit, :update, :destroy]

  def index
    @development_tasks = DevelopmentTask.all
  end

  def show
  end

  def new
    @development_task = DevelopmentTask.new
  end

  def edit
  end

  def create
    @development_task = DevelopmentTask.new(dev_task_params)
    if @development_task.save
      redirect_to development_tasks_path
    else
      render 'new'
    end
  end

  def update
    if @development_task.update(dev_task_params)
      redirect_to development_tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    @development_task.destroy
    redirect_to development_tasks_path
  end

  private
    def set_development_task
      @development_task = DevelopmentTask.find(params[:id])
    end

    def dev_task_params
      params.require(:development_task).permit(:task_name, :details, :start_date, :completion_date, :completed)
    end
end
