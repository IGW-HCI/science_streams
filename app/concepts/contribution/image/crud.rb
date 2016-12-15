class Contribution::Image < ApplicationRecord
  class Create < Trailblazer::Operation
    include Model
    model Contribution::Image, :create

    contract do
      property :image, validates: { presence: true }
      property :copyright, validates: { presence: true }
      property :project_id, validates: { presence: true }
      property :user_id, validates: { presence: true }
    end

    def process(params)
      validate(params[:contribution_image], &:save)
    end

    private

    def setup_model!(params)
      model.user = User.first
      model.project = Project.find_by(id: params[:id])
    end
  end
end
