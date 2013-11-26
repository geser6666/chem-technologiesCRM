class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :client_id

      t.timestamps
    end

    add_index :relationships, :user_id
    add_index :relationships, :client_id
    add_index :relationships, [:user_id, :client_id], unique: true
  end
end
