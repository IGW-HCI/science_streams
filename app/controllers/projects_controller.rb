class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :contributions]
  before_action :set_contributions, only: [:show, :contributions]
  
  def index
    @projects = Project.all
  end

  def show
  end

  def contributions

  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def set_contributions
    @text_contributions  = @project.contributed_texts
    @image_contributions = @project.contributed_images
    @contributions = @text_contributions + @image_contributions
  end
end
