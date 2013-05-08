class Meetup < ActiveRecord::Base
  attr_accessible :sender_id, :recipient_id, :date, :venue, :message, :accept_status, :prev_meetup_id

  has_many :reviews
  
  belongs_to :recipient, :class_name => 'User', :foreign_key => 'recipient_id'
  belongs_to :sender, :class_name => 'User', :foreign_key => 'sender_id'
  
  belongs_to :previous_meetup, :class_name => 'Meetup', :foreign_key => ':prev_meetup_id'
  
  def has_reviewed(user)
    return self.reviews.where("reviewer_id = #{user.id}").count > 0
  end

end
