class Review < ActiveRecord::Base
  attr_accessible :meetup_id, :reviewee_id, :reviewer_id, :positive, :comment
  
  belongs_to :meetup
  belongs_to :reviewee, :class_name => 'User', :foreign_key => 'reviewee_id'
  belongs_to :reviewer, :class_name => 'User', :foreign_key => 'reviewer_id'
  
end
