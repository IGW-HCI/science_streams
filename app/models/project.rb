class Project < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :about_us, presence: true
  validates :slug, presence: true

  has_many :projects_users
  has_many :users, through: :projects_users

  def admins
    users.merge(ProjectsUser.admin)
  end

  def collaborators
    users.merge(ProjectsUser.collaborator)
  end
end
