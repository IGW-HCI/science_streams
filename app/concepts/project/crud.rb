class Project < ApplicationRecord
  class Index < Trailblazer::Operation
    include Collection

    def model!(_params)
      Project.all
    end
  end

  class Create < Trailblazer::Operation
    include Model
    model Project, :create

    contract do
      property :title, validates: { presence: true }
      property :description, validates: { presence: true }
      property :about_us, validates: { presence: true }
      property :slug, validates: { presence: true }
      property :image, validates: { presence: true }
    end

    def process(params)
      validate(params[:project], &:save)
    end
  end

  class Update < Create
    model Project, :update

    contract do
      property :slug, writeable: false
    end
  end
end
