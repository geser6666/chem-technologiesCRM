class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :client_id
      t.integer :contacttype_id
      t.string :value
      t.integer :employee_id

      t.timestamps
    end
    add_index :contacts, :client_id
    add_index :contacts, :contacttype_id
    add_index :contacts, :employee_id
  end
end
