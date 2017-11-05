class Company < ActiveRecord::Base
  has_many :tasks
  belongs_to :users

  def new_task_attributes=(task_attributes)
    task_attributes.each do |attributes|
      tasks.build(attributes)
    end
  end

  def save_tasks
    tasks.each do |task|
      task.save(false)
    end
  end
end
