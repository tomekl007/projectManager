class ProjectuserController < ApplicationController

  def add_user_to_project
    #@project = project
    logger.info 'add user to project projectuser_controller'
    @user = User.find(session[:user_id])
    logger.info "get params : #{params[:id]}"
    logger.info "get params : #{params[:project_id]}"
    @project = Project.find(params[:project_id])

    if @project.users.include?(@user)
      logger.info "project #{@project} already contain user #{@user.name}"
      flash[:notice] ='you are already assigned to this project'
      redirect_to projects_path
      return
    else
      @project.users << @user
    end
   # @project.users << User.new(:name => @user.name, :id => @user.id, :updated_at => @user.updated_at)


    respond_to do |format|
      format.atom
      # format.xml { render :xml => @product.to_xml(:include=>:orders)}
      # format.json {render :json => @product.to_json(:include=>:orders)}
      format.html { render action: 'add_user_to_project' }
    end
 end
end
