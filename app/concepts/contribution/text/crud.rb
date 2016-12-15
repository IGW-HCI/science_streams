class Contribution::Text < ApplicationRecord
  class Create < Trailblazer::Operation
    include Model
    model Contribution::Text, :create

    contract do
      property :body, validates: { presence: true }
      property :project_id, validates: { presence: true }
      property :user_id, validates: { presence: true }
    end

    def process(params)
      validate(params[:contribution_text], &:save)
    end

    private

    def setup_model!(params)
      model.user = User.first # TODO: current_user
      model.project = Project.find_by(id: params[:id])
    end
  end
end
