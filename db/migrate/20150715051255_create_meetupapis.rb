class CreateMeetupapis < ActiveRecord::Migration
  def change
    create_table :meetupapis do |t|

      t.timestamps null: false
    end
  end
end
