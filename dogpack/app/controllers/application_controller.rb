class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout :layout

  before_filter :set_timezone 

  def set_timezone  
    Time.zone = current_user.time_zone if current_user
  end 

  def layout
    # only turn it off for login pages:
    is_a?(Devise::SessionsController) ? false : "application"
    # or turn layout off for every devise controller:
    !devise_controller? && "application"
  end
  
  
  
end
