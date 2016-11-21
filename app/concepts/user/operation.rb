class User < ApplicationRecord
  class Create < Trailblazer::Operation
    include Model
    model User, :create

    contract do
      property :email, presence: true
      property :password, presence: true
    end

    def process(params)
      validate(params[:user], &:save)
    end
  end
end
