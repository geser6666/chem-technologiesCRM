class CreateNegotiations < ActiveRecord::Migration
  def change
    create_table :negotiations do |t|
      t.integer :client_id
      t.integer :user_id
      t.string :value

      t.timestamps
    end
     add_index :negotiations, :client_id
     add_index :negotiations, :user_id
  end
end
