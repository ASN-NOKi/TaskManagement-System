class TasksController < ApplicationController
  # before_action :set_user, only: [:new, :show, :edit]
  
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    @task.user_id = params[:user_id]
    @task.save
    redirect_to user_tasks_url(params[:user_id])
  end

  def index
    @tasks = Task.where(user_id: params[:user_id])
       
  end
  
  def show
    @task = Task.find(params[:id])
    # @task = Task.find(params[:id])
    # @task = Task.find_by
  end

  def edit
  end
  
  
  # def set_user_tasks(user)
  #   @tasks = Task.where(user_id: user.id)
  # end
  private
  
  def task_params
    params.require(:task).permit(:content, :description, :user_id)
  end
  
end
