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

end
