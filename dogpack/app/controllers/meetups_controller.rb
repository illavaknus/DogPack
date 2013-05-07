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

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /meetups/1/edit
  def edit
    @meetup = Meetup.find(params[:id])
  end

  # POST /meetups
  def create
    @meetup = Meetup.new(params[:meetup])

    respond_to do |format|
      if @meetup.save
        format.html { redirect_to @meetup, notice: 'Meetup was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /meetups/1
  def update
    @meetup = Meetup.find(params[:id])

    respond_to do |format|
      if @meetup.update_attributes(params[:meetup])
        format.html { redirect_to @meetup, notice: 'Meetup was successfully updated.' }
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
