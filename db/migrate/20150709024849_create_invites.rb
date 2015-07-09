class CreateInvites < ActiveRecord::Migration
  	def change
	    create_table :invites do |t|
	      t.integer :sender_id
	      t.integer :recipient_id

	      t.timestamps null: false
    	end
	    add_index :invites, :sender_id
	    add_index :invites, :recipient_id
 
  	end
end
