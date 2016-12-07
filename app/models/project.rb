require "ProjectImageUploader"

class Project < ApplicationRecord
  include ::ProjectImageUploader[:image]

  has_many :projects_users, dependent: :destroy
  has_many :users, through: :projects_users
  accepts_nested_attributes_for :users, reject_if: :all_blank, allow_destroy: true

  has_many :contributed_texts, class_name: "Contribution::Text", dependent: :destroy
  has_many :contributed_images, class_name: "Contribution::Image", dependent: :destroy

  def admins
    users.merge(ProjectsUser.admin)
  end

  def collaborators
    users.merge(ProjectsUser.collaborator)
  end

  def contributions
    contributions = Array.new

    contributions << contributed_texts
    contributions << contributed_images

    contributions.flatten
  end
end
