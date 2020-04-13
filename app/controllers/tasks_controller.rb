class TasksController < ApplicationController
  def new
  end

  def index
    @tasks = Task.where(user_id: params[:user_id])
    
    @user = User.find(1)
    
  end

  def edit
  end
end
