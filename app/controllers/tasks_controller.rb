class TasksController < ApplicationController
  before_action :set_tasks_user
  before_action :logged_in_user
  before_action :request_path, only: [:new, :edit, :create, :update]
  before_action :correct_user
  
  
  def index
    @tasks = @user.tasks.order(id: :desc)
  end
  
  def new
    @task = @user.tasks.new
  end
  
  def create
    @task = @user.tasks.new(task_params)
    @task.user_id = @user.id
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url(@task.user_id)
    else
      render :new
    end
  end


  
  def show
    @task = Task.find(params[:id])
  end    

  def edit
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
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "タスクを削除しました。"
    redirect_to user_tasks_url(@task.user_id)
  end


  private
  
  def task_params
    params.require(:task).permit(:content, :description)
  end
  
  def set_tasks_user
    @user = User.find(params[:user_id])
  end
  
  def del_msg(task)
    @del_msg = "「#{task.content}」を削除します。よろしいですか？"
  end
  
end
