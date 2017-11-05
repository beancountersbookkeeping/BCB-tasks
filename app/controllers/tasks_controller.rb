class TasksController < ApplicationController
  include ApplicationHelper

  before_filter :authenticate_user!

  def index
    @tasks = Task.all
    @companys = Company.all
    @users = User.all
    @tasks_grid = initialize_grid(Task)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
    @task.company.build
    @company = Company.new
    @user = User.new
  end

  def create
    @task = Task.new
    @task.title = params[:task][:title]

    if @task.save
      flash[:notice] = "Task was saved."
      redirect_to tasks_path
    else
      flash.now[:alert] = "There was an error saving. Please try again."
      redirect_to tasks_path
    end
  end

   def destroy
     @task = Task.find(params[:id])
     @task.archived = false
     @task.save
   end

end
