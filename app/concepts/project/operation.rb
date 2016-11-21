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
      property :title, presence: true
      property :description, presence: true
      property :about_us, presence: true
      property :slug, presence: true
      property :image, presence: true
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

  class InviteUsers < Trailblazer::Operation
    contract do
      collection :users,
                 prepopulator: :prepopulate_users!,
                 populate_if_empty: :populate_users!,
                 skip_if: :all_blank do
        property :email
        validates :email, presence: true # , email: true
      end

      # def populate_users!(options)
      #   # find existing user with email or create a new one
      #   User.find_by_email(options[:fragment]["email"]) || User.new
      # end
    end

    def model!(params)
      Project.find(params[:project][:id])
    end

    def process(params)
      validate(params[:project], &:save)
      raise
    end

    private

    def prepouplate_users!(_options)
      # Add add least one user field
      (1 - users.size).times do
        users << User.new
      end
    end
  end
end
