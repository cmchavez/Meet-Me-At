class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :name
      t.string :zipcode
      t.integer :user_id
      t.integer :recipient_id

      t.timestamps null: false
    end
  end
end
