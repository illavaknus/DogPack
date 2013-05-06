class User < ActiveRecord::Base
  acts_as_authentic
  
  attr_accessible :name, :email, :owner, :image_url, :age, :breed, :weight, :location, :longitude, :overall_rating
  
  has_many  :previous_meetups, :finder_sql => proc{
            "SELECT * FROM meetups "+
            "WHERE ( #{id} = sender_id "+
            "OR #{id} = recipient_id ) "+
            "AND accept_status = 1 "+
            "AND date < now() "},
            :class_name => 'Meetup',
            :include => [:sender, :recipient], 
            :dependent => :destroy
            
  has_many  :upcoming_meetups, :finder_sql => proc {
            "SELECT * FROM meetups "+
            "WHERE (#{id} = sender_id "+
            "OR #{id} = recipient_id) "+
            "AND accept_status = 1 "+
            "AND date > now()" },
            :class_name => 'Meetup',
            :include => [:sender, :recipient], 
            :dependent => :destroy
  
  has_many :invitations, :class_name => 'Meetup', :foreign_key => 'recipient_id',
           :conditions => 'accept_status = 0', :include => :sender
  
  has_many :reviews, :foreign_key => 'reviewee_id', :dependent => :destroy


end
