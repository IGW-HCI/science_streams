require "cocoon_view_helpers"

class Project < ApplicationRecord
  class ManageUsers < Trailblazer::Operation
    include Model
    model Project, :find

    contract do
      include Reform::Form::ActiveModel::ModelReflections
      feature Disposable::Twin::Persisted

      collection :users, prepopulator: :prepopulate_users!,
                         populator: :populate_users!,
                         skip_if: :all_blank do
        include NestedForm
        property :email
        validates :email, presence: true
      end

      def prepopulate_users!(_options)
        # Add add least one user field
        (1 - users.size).times do
          users << User.new
        end
      end

      def populate_users!(fragment:, collection:, **)
        destroy_association = fragment["_destroy"].eql? "1"

        item = users.detect { |element| element.id.to_s == fragment[:id].to_s }

        if destroy_association
          collection.delete(item)
          return skip!
        end

        return item if item

        # New Entry, either add a existion user or create a new one
        user = User.find_by(email: fragment["email"]) || User.new(password: Devise.friendly_token[0, 7])
        users.append(user)
      end
    end

    def process(params)
      validate(params[:project]) do |f|
        f.save
        create_empty_profiles_for_new_users!
        notify_users!
      end
    end

    private

    def create_empty_profiles_for_new_users!
      model.users.each do |user|
        next if user.profile.present?
        Profile::Create.call(
          user_id: user.id,
          profile: {}
        )
      end
    end

    def notify_users!
      contract.users.each do |user|
        if user.created?
          UserMailer.welcome(user.model).deliver_later
        elsif contract.users.added.include? user
          UserMailer.added_to_project(user.model).deliver_later
        end
      end
    end
  end
end
