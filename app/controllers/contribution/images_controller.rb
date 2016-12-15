class Contribution::ImagesController < ApplicationController
  def new
    form Contribution::Image::Create
  end

  def create
    run Contribution::Image::Create do |_op|
      # valid operation
      return redirect_to project_path(@model.project)
    end

    render action: :new
  end
end
