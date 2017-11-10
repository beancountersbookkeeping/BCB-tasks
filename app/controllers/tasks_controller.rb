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
    @company = Company.find(params[:company_id])
    @task = Task.new
    @user = User.new
  end

  def create
    @company = Company.find(params[:company_id])
    @task = @company.tasks.build


    if @task.save
      flash[:notice] = "Task was saved."
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error saving. Please try again."
      redirect_to root_path
    end
  end

   def destroy
     @task = Task.find(params[:id])
     @task.archived = false
     @task.save
   end

end
