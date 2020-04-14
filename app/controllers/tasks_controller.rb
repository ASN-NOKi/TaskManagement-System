class TasksController < ApplicationController
  # before_action :set_user, only: [:new, :show, :edit]
  
  
  def new
  end

  def index
    @tasks = Task.where(user_id: params[:user_id])
    task = @tasks[0]
    puts "==========="
    puts task.id
    puts "==========="    
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
  
end
