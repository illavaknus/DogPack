class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user
  
  private
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def require_login
    unless current_user
      redirect_to '/login', layout: false, notice: 'You must be logged in to access this page'
    end
  end
  
  def no_require_login
    if current_user
      redirect_to '/', notice: 'You must be logged out to access this page'
    end
  end
  
end
