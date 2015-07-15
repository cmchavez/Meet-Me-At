class CreateEmailInvitations < ActiveRecord::Migration
  def change
    create_table :email_invitations do |t|
      t.integer :sender_id
      t.string :recipient_email
      t.string :token
      t.datetime :sent_at

      t.timestamps null: false
    end
  end
end
