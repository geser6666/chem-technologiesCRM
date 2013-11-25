class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address
      t.integer :country_id

      t.timestamps
    end
    add_index :clients, :name
  end
end
