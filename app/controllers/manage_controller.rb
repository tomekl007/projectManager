class ManageController < ApplicationController
  def index
    @user_logged_in = current_user
    redirect_to projects_url
  end
end
