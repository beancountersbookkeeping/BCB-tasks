class Task < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :company, dependent: :destroy

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
    @task.save
  end

  def self.save_time(params)
    @task_id = params["task_id"]
    @task = Task.find_by_id(@task_id)
    @task.time = params["time"]
    @task.save
  end

end
