class Profile < ApplicationRecord
  class Create < Trailblazer::Operation
    include Model
    model Profile, :create

    contract do
      property :nickname, presence: true
      property :first_name
      property :last_name
      property :image
    end

    def process(params)
      validate(params[:profile], &:save)
    end

    private

    def setup_model!(params)
      model.user = User.find_by_id(params[:user_id])
    end
  end
end
