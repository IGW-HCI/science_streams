class Project < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :about_us, presence: true
  validates :slug, presence: true

  has_many :projects_users, dependent: :destroy
  has_many :users, through: :projects_users

  has_many :contributed_texts, class_name: "Contribution::Text", dependent: :destroy
  has_many :contributed_images, class_name: "Contribution::Image", dependent: :destroy

  def admins
    users.merge(ProjectsUser.admin)
  end

  def collaborators
    users.merge(ProjectsUser.collaborator)
  end
end
