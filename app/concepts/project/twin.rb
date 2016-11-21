class ProjectTwin < Disposable::Twin
  property :title
  property :users
  property :about_us
  property :description

  def contributions
    model.contributed_texts + model.contributed_images
  end
end
