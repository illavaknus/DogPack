class MeetupsController < ApplicationController
  
   before_filter :authenticate_user!
   
  # GET /meetups
  # def index
    # @meetups = Meetup.all
# 
    # respond_to do |format|
      # format.html # index.html.erb
    # end
  # end

  # # GET /meetups/1
  # def show
    # @meetup = Meetup.find(params[:id])
#     
    # respond_to do |format|
      # format.html # show.html.erb
    # end
  # end

  # GET /meetups/new
  def new
    @meetup = Meetup.new
    @recipient = User.find_by_id(params[:recipient_id])
    
    @recipient_meetups = []
    @recipient.upcoming_meetups.each do |m|
      @recipient_meetups.push({:title=> @recipient.name, :start=> m.date.strftime('%m-%d-%Y %H:%M:%S'), :end=> (m.date + 1.hour).strftime('%m-%d-%Y %H:%M:%S'), :allDay=> false})
    end
    
    @my_meetups = []
    current_user.upcoming_meetups.each do |m|
      @my_meetups.push({:title=> current_user.name, :start=> m.date.strftime('%m-%d-%Y %H:%M:%S'), :end=> (m.date + 1.hour).strftime('%m-%d-%Y %H:%M:%S'), :allDay=> false})
    end

    gon.recipient = @recipient
    gon.me = current_user
    gon.recipient_meetups = @recipient_meetups
    gon.my_meetups = @my_meetups
    
    @current_user = current_user
    @prev_meetup_id = params[:prev_meetup_id]
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /meetups/1/edit
  def edit
    @meetup = Meetup.find(params[:id])
    @meetups = Meetup.all(:conditions => ["DATE(date) = DATE(?) AND (sender_id = ? OR recipient_id = ?) AND accept_status = 1", @meetup.date, current_user.id, current_user.id])
    @current_user = current_user;
    @sender = @meetup.other(@current_user)
  end

  # POST /meetups
  def create
    @meetup = Meetup.new(params[:meetup])
    @meetup.date = Time.at(params[:meetup][:date].to_i)
    
    respond_to do |format|
      if @meetup.save
       if(@meetup.prev_meetup_id.nil? )
          response = "Meetup invitation was sent"
        else
          prev = Meetup.find(@meetup.prev_meetup_id)
          prev.accept_status = -1
          prev.save
          response = "Rescheduling request was sent"
        end
        format.html { redirect_to "/", notice: response }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /meetups/1
  def update
    @meetup = Meetup.find(params[:id])
    action = params[:commit]
    
    if action == "Reject" || action == "Cancel" 
      @meetup.accept_status = -1;
      if action == "Reject"
        response = "Invitation was rejected"
      else
        response = "Meetup was cancelled"
      end
    else
      @meetup.accept_status = 1;
      response = "Invitation was accepted"
    end

    respond_to do |format|
      if @meetup.save
        format.html { redirect_to "/", notice: response }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /meetups/1
  def destroy
    @meetup = Meetup.find(params[:id])
    @meetup.destroy

    respond_to do |format|
      format.html { redirect_to meetups_url }
    end
  end
end
