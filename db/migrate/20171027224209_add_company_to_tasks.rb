class AddCompanyToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :company_id, :integer
    add_index :tasks, :company_id
  end
end
