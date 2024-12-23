class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def details
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    # create new database record with the form data
    task = Task.new(task_params)
    task.save
    # redirect to the show page
    redirect_to task_path(task)
  end

  private
  # only allow the permitted parameters to be used in the create action
  def task_params
    params.require(:task).permit(:title, :details)
  end
end
