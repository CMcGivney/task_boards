class TasksController < ApplicationController
  before_action :set_list, only: [:show, :new, :create, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    if @task.save
      redirect_to list_tasks_path(@list)
    else
      render :new
    end
  end

  def update
    if @task.update(list_params)
      redirect_to list_task_path(@list, task)
    else
      render :edit
    end
  end

  def show
  end

  def edit
  end
  private
  def set_list
    @list = List.find(params[:list_id])
    end
   def task_params
    params.require(:task).permit(:name, :completed, :priority)
   end
    
end
