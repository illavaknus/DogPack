class ReviewsController < ApplicationController
  
  before_filter :authenticate_user!
  
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = Review.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/new
  # GET /reviews/new.json
  def new
    @review = Review.new
    
    @meetup = Meetup.find(params[:meetup_id])
    other_user_id = @meetup.sender_id == current_user.id ? @meetup.recipient_id : @meetup.sender_id
    @reviewee = User.find(other_user_id)
    @reviewer = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    if params[:review] and !params[:review].empty?
      @review = Review.new(params[:review])
    else
      m = Meetup.find(params[:meetup_id])
      other_user_id = m.sender_id == current_user.id ? m.recipient_id : m.sender_id
      @review = Review.new(:meetup_id => params[:meetup_id],
                           :reviewer_id => current_user.id,
                           :reviewee_id => other_user_id,
                           :positive => params[:positive])
    end
    
    respond_to do |format|
      if @review.save
        format.html { redirect_to '/', notice: "Your review of #{@review.reviewee.name} was submitted" }
        format.json { render json: @review, status: :created, location: @review }
      else
        format.html { render action: "new" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reviews/1
  # PUT /reviews/1.json
  def update
    @review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to @review, notice: "Your review of #{@review.reviewee.name} was updated" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end
end
