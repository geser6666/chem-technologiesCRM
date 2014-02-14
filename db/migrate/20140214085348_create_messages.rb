class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :negotiation_id
      t.integer :user_id

      t.timestamps
    end

	add_index :messages, :negotiation_id
	add_index :messages, :user_id
    
    add_index :messages, [:negotiation_id, :user_id], unique: true
  end
end
