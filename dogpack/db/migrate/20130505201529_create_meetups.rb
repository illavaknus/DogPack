class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.timestamp :date
      t.string :venue
      t.string :message
      t.integer :accept_status
      t.integer :prev_meetup_id
      
      t.timestamps
    end
  end
end
