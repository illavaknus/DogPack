class Friendship < ActiveRecord::Base
  attr_accessible :user_id, :friend_id
  
end
