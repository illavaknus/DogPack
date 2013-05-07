class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      #Login Details
      t.string :email,              :null => false
      t.string :crypted_password,   :null => false
      t.string :password_salt,      :null => false
      t.string :persistence_token,  :null => false
      
      #Model Attributrs
      t.string :name
      t.string :owner    
      t.string :image_url
      t.integer :age
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
