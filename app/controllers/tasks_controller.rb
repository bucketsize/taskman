require 'pp'

class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.xml
  def index
    @task = Task.new(:label => 'main')
    @subtasks = Task.all.select{|t| t.parent == nil and t.user == current_user}


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subtasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @task = Task.find(params[:id])
    @subtasks = @task.children

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    @task = Task.new
    
    if params[:task_id].nil?
      @parent = Task.new
    else
      @parent = Task.find(params[:task_id])
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.xml
  def create
    @task = Task.new(params[:task])
    @task.user = current_user
    
    # set the parent task
    if params[:task][:id].nil? or params[:task][:id].blank? 
      @task.parent = nil
    else
      @task.parent = Task.find(params[:task][:id])
    end

    respond_to do |format|
      if @task.save
        format.html { redirect_to(@task, :notice => 'Task was successfully created.') }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /tasks/1
  # PUT /tasks/1.xml
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to(@task, :notice => 'Task was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { head :ok }
    end
  end
end
