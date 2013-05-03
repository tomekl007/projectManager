class ProjectuserController < ApplicationController

  def add_user_to_project
    #@project = project
    logger.info 'add user to project projectuser_controller'
    @user = User.find(session[:user_id])
    logger.info "get params : #{params[:id]}"
    logger.info "get params : #{params[:project_id]}"
    @project = Project.find(params[:project_id])


   # @project.users << User.new(:name => @user.name, :id => @user.id, :updated_at => @user.updated_at)
    @project.users << @user

    respond_to do |format|
      format.atom
      # format.xml { render :xml => @product.to_xml(:include=>:orders)}
      # format.json {render :json => @product.to_json(:include=>:orders)}
      format.html { render action: 'user_added_to_project'  }
    end
 end
end
