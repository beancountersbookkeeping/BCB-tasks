class Createcompanys < ActiveRecord::Migration
  def change
    create_table :companys do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
