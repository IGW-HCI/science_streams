require "ContributionImageUploader"

class Contribution::Image < ApplicationRecord
  include ::ContributionImageUploader[:image]

  belongs_to :project
  belongs_to :user
end
