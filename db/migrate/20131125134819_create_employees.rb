class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :client_id

      t.timestamps
    end
    add_index :employees, :client_id
  end
end
