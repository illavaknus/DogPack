class UserSessionsController < ApplicationController

  # GET /login
  def new
    @user_session = UserSession.new
  end

  # POST /user_sessions
  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
        format.html { redirect_to "/", notice: "Login Successful!" }
      else
        format.html { render action: "new" }
      end
    end
  end

  # DELETE /user_sessions/1
  def destroy
    @user_session = UserSession.find(params[:id])
    @user_session.destroy

    respond_to do |format|
      format.html { redirect_to '/login', notice: "" }
    end
  end
  
end
