class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
    logger.info " news #{params[:project_id]}"
    session[:project_id] = params[:project_id]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
     logger.info "xxx #{@project} "
    logger.info " creates #{params[:project_id]}"
    logger.info " creates #{session[:project_id]}"
    @task.project = Project.find(session[:project_id])
    Notifier.new_task(@task).deliver   #send notification

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  def add_task_to_project
    logger.info "task new get param #{params[:project_id]}"
    @project = Project.find(params[:project_id])
    @task = Task.new(params[:task])
    Notifier.new_task(@task).deliver   #send notification
    if @task.save
      format.html { redirect_to @task, notice: 'Task was successfully created.' }
      format.json { render json: @task, status: :created, location: @task }
    else
      format.html { render action: "new" }
      format.json { render json: @task.errors, status: :unprocessable_entity }
    end
  end

  def mark_task_as_done
    @task = Task.find(params[:task_id])
    @task.update_attributes(:done => true)
    @project = Project.find(params[:project_id])
    Notifier.task_succed(@task).deliver


    redirect_to @project

  end

end
