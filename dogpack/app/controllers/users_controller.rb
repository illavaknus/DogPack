class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  
  #GET /
  def current
    @user = current_user
    
    respond_to do |format|
      format.html #current.html.erb
    end
  end
  
  # GET /users/1
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.where("positive = true AND comment IS NOT NULL")
    
    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
