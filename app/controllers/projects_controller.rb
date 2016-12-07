class ProjectsController < ApplicationController
  def index
    present Project::Index
    @projects = @model
  end

  def show
    present Project::Update
    @project = @model
  end

  def new
    form Project::Create
  end

  def create
    run Project::Create do |_op|
      # valid operation
      return redirect_to manage_users_project_path(@model)
    end

    render action: :new
  end

  def manage_users
    form Project::ManageUsers
  end

  def add_and_remove_users
    run Project::ManageUsers do |_op|
      return redirect_to project_path(@model)
    end
  end

  def contributions; end
end
