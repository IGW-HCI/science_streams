class Contribution::TextsController < ApplicationController
  def new
    form Contribution::Text::Create
  end

  def create
    run Contribution::Text::Create do |_op|
      # valid operation
      return redirect_to project_path(@model.project)
    end

    render action: :new
  end
end
