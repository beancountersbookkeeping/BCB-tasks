class TasksController < ApplicationController
  include ApplicationHelper

  before_filter :authenticate_user!

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
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

     if @task.destroy
       flash[:notice] = "\"#{@task.title}\" was deleted successfully."
       redirect_to root_path
     else
       flash.now[:alert] = "There was an error deleting."
       redirect_to root_path
     end
   end

end
