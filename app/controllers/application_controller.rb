class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize


  #@user = User.find(session[:user_id])

  def current_user
    #begin
      User.find(session[:user_id])
    #rescue ActiveRecord::RecordNotFound
      #ignore for now
     # logger.info 'current user not found'
   # end
  end

  #def index
  #@user_logged_in = current_user
  #end

  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, :notice => "Please log in"
    end
  end

end
