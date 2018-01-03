class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :company

  def self.save_task_errors(params, current_user)
    @errors = ""
    @company = Company.find_by_id(params["task"]["company_id"])
    @title = params["task"]["title"]
    if current_user == nil then @errors += "No logged user." 
    elsif @company == nil then @errors += "No company chosen." 
    elsif @title == "" then @errors += "Task title is empty." 
    end
    return @errors
  end

  def self.save_task(params, current_user)
    @errors = ""
    @company = Company.find_by_id(params["task"]["company_id"])
    @title = params["task"]["title"]
    @task = Task.new
    @task.title = @title
    @task.company_id = @company.id 
    @task.user_id = @company.user_id
    @task.recreate_task_days = params["task"]["recreate_task_days"]
    @task.save
  end

  def self.save_time(params)
    @task_id = params["task_id"]
    @task = Task.find_by_id(@task_id)
    @task.time = params["time"]
    @task.save
  end

  def self.create_todays_tasks
    @tasks = Task.all
    @today = Date.parse(Time.now.to_s)
    for @task in @tasks do
      @new_day = Date.parse((@task.created_at + @task.recreate_task_days.days).to_s)
      if @new_day == @today then 
        @new_task = Task.new
        @new_task.title = @task.title
        @new_task.recreate_task_days = @task.recreate_task_days
        @new_task.user_id = @task.user_id
        @new_task.company_id = @task.company_id
        @new_task.archived = @task.archived
        @new_task.save
      end
    end
  end


end
