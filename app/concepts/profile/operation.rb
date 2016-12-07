class Profile < ApplicationRecord
  class Create < Trailblazer::Operation
    include Model
    model Profile, :create

    contract do
      property :nickname
      property :first_name
      property :last_name
      property :image
    end

    def process(params)
      params[:profile][:image] = create_identicon! if params.dig(:profile, :image).nil?
      validate(params[:profile], &:save)
    end

    private

    def create_identicon!
      blob = RubyIdenticon.create(model.user.email, grid_size: 8, square_size: 100)
      file_name = "tmp/identicons/#{model.user.email}.png"
      File.open(file_name, "wb") { |f| f.write(blob) }

      File.open(file_name)
    end

    def setup_model!(params)
      model.user = User.find_by(id: params[:user_id])
    end
  end

  class Update < Create
    include Model
    model Profile, :update

    contract do
      property :nickname, presence: true
    end

    def process(params)
      validate(params[:profile], &:save)
    end
  end
end
