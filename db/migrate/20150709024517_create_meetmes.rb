class CreateMeetmes < ActiveRecord::Migration
  def change
    create_table :meetmes do |t|
      t.integer :sender_id
      t.integer :recipient_id
 
      t.timestamps
    end
    
    add_index :meetmes, :sender_id
    add_index :meetmes, :recipient_id
  end
end
