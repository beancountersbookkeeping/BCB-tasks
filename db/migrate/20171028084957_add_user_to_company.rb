class AddUserToCompany < ActiveRecord::Migration
  def change
    add_column :companys, :user_id, :integer
    add_index :companys, :user_id
  end
end
