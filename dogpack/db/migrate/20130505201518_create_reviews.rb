class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :meetup_id
      t.integer :reviewee_id
      t.integer :reviewer_id
      t.boolean  :positive
      t.string :comment
            
      t.timestamps
    end
  end
end
