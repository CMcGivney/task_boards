class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, only: [:show, :edit, :destroy, :update]
  def new
    @task = Task.new
  end

  def create
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to board_list_path(@list.board_id, @list)
    else
      render :new
    end
  end

  def update
    if @task.update(list_params)
      redirect_to board_list_path(@list.board_id, @task)
    else
      render :edit
    end
  end

  def show
  end

  def edit
  end

  def destroy
  @task.destroy
  redirect_to board_lists_path
  end
  
  private
  def set_list
    @list = List.find(params[:list_id])
    end

  def set_task
    @task = Task.find(params[:id])
  end

   def task_params
    params.require(:task).permit(:name, :completed, :priority)
   end
    
end
