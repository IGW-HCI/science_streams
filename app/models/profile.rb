require "ProfileImageUploader"

class Profile < ApplicationRecord
  include ::ProfileImageUploader[:image]

  belongs_to :user, touch: true
end
