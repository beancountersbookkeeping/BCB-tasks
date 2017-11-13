class TasksController < ApplicationController
  include ApplicationHelper
  skip_before_action :verify_authenticity_token, only: [:save_time]
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
    @company_id = params[:company_id]
    
  end

  def create    
    @errors = Task.save_task_errors(params, current_user)
    if @errors == "" then
      Task.save_task(params, current_user)
      flash[:notice] = "Task was successfully saved."
      redirect_to :controller => 'companies', :action => 'show', :id => params[:task][:company_id]
    else
      flash.now[:alert] = @errors 
      render :action => 'new', :company_id => params[:company_id]
    end    
  end

   def destroy
     @task = Task.find(params[:id])
     @task.archived = false
     @task.save
   end

  def save_time
    Task.save_time(params)
  end

end
