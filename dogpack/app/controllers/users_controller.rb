class UsersController < ApplicationController

  before_filter :require_login, :only => [:current, :show]
  before_filter :no_require_login, :only => [:new, :create]
  
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

    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  # GET /users/new
  def new
    @user = User.new
  end
  
  # Create a new user
  # On success redirect to login screen
  # On failure, return back to new
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        redirect_to  '/login', :notice => "User created!"
      else
        render :action => :new
      end
    end
  end

end
