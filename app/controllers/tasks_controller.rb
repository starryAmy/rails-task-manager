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

  def edit
    @task = Task.find(params[:id])
  end

  def update
    # find the record to update
    task = Task.find(params[:id])
    # update the record with the form data
    task.update(task_params)
    # redirect to the show page
    redirect_to task_path(task)
  end

  def destroy
    # find the record to delete
    @task = Task.find(params[:id])
    # delete the record
    @task.destroy
    # redirect to the index page
    # 這通常用於指示一個 POST 或 DELETE 操作之後，應該使用 GET 請求重定向到某個 URL。使用 303 可以確保用戶在刪除後不會重複提交同樣的刪除請求，並且會重定向到任務列表頁面。
    redirect_to tasks_path, status: :see_other
  end

  private
  # only allow the permitted parameters to be used in the create action
  def task_params
    params.require(:task).permit(:title, :details)
  end

end
