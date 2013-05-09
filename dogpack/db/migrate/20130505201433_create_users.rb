class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      
      #Model Attributrs
      t.string :name
      t.string :owner    
      t.string :image_url
      t.string :age
      t.string :breed
      t.string :size
      t.string :location
      t.float :longitude
      t.float :latitude
      t.integer :overall_rating
      
      t.timestamps
    end
  end
end
