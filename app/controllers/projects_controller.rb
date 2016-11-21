class ProjectsController < ApplicationController
  def index
    present Project::Index
    @projects = @model
  end

  def show
    present Project::Update
    @project = @model
  end

  def contributions
  end
end
