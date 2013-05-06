class Meetup < ActiveRecord::Base
  attr_accessible :sender_id, :recipient_id, :date, :venue, :message, :accept_status, :prev_meetup_id

  has_many :reviews
  
  belongs_to :recipient, :class_name => 'User', :foreign_key => 'recipient_id'
  belongs_to :sender, :class_name => 'User', :foreign_key => 'recipient_id'
  
  belongs_to :previous_meetup, :class_name => 'Meetup', :foreign_key => ':prev_meetup_id'

end
