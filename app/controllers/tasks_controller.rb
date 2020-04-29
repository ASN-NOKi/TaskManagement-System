class TasksController < ApplicationController
  # before_action :set_user, only: [:new, :show, :edit]
  before_action :request_path, only: [:new, :edit]
  
  
  def index
    @user = current_user # User.find(params[:id])  # current_user
    @tasks = @user.tasks.order(id: :desc)
  end
  
  def new
    @user = User.find(params[:user_id])
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url(@task.user_id)
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
    @user = User.find(params[:user_id])
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = "タスクを更新しました。"
      redirect_to user_task_url(@task.user_id, @task.id)
    else
      render :edit
    end
  end
  
  def destroy
    # @user = User.find(params[:user_id])
    # @task = @user.tasks.find(params[:id])
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "タスクを削除しました。"
    redirect_to user_tasks_url(@task.user_id)
  end




  private
  
  def task_params
    params.require(:task).permit(:content, :description)
  end
  
end
