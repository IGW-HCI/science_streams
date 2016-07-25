class ProjectsUser < ApplicationRecord
  enum project_role: [:collaborator, :admin]

  belongs_to :project, touch: true
  belongs_to :user
end
