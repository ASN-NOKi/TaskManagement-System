class TasksController < ApplicationController
  # before_action :set_user, only: [:new, :show, :edit]
  
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to tasks_index_user_url(@task.user_id)
    else
      render :new
    end
  end


  
  def show
    # @task = Task.find(params[:id])
    @user = User.find(params[:user_id])
    # # @tasks = @user.tasks(user_id: params[:user_id])
    @task = @user.tasks.find(params[:id])
   
  end    

  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    # @task = Task.find
  end
  
  def destroy
  end




  private
  
  def task_params
    params.require(:task).permit(:content, :description)
  end
  
end
