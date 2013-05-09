class MeetupsController < ApplicationController
  
  # GET /meetups
  def index
    @meetups = Meetup.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /meetups/1
  def show
    @meetup = Meetup.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /meetups/new
  def new
    @meetup = Meetup.new
    @recipient = User.find_by_id(params[:recipient_id])
    
    @recipient_meetups = []
    @recipient.upcoming_meetups.each do |m|
      @recipient_meetups.push({:title=> recipient.name, :start=> m.date.strftime('%m-%d-%Y %H:%M:%S'), :end=> (m.date + 1.hour).strftime('%m-%d-%Y %H:%M:%S'), :allDay=> false})
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
    @meetups = Meetup.all(:conditions => ["DATE(created_at) = DATE(?) AND (sender_id = ? OR recipient_id = ?) ", @meetup.date, current_user.id, current_user.id])
    @current_user = current_user;
    @sender = @meetup.other(@current_user)
  end

  # POST /meetups
  def create
    @meetup = Meetup.new(params[:meetup])

    respond_to do |format|
      if @meetup.save
        format.html { redirect_to "/", notice: 'Invtation was sent' }
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
        response = "Invitatin was rejected"
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
