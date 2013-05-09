class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  attr_accessible :name, :owner, :image_url, :age, :breed, :size, :location, :longitude, :latitude, :overall_rating
  
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


  def rating
    positive_count = self.reviews.where("positive = true").count
    if self.reviews.count == 0
      return 0
    else
      return ((positive_count/self.reviews.count) * 100)
    end
  end

end
