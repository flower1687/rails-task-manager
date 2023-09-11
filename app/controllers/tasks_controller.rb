class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    @task.save
    # No need for app/views/tasks/create.html.erb
    redirect_to task_path(@task)
  end

  def show
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
