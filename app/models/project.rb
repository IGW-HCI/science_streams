class Project < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :about_us, presence: true
  validates :slug, presence: true

  has_many :projects_users, dependent: :destroy
  has_many :users, through: :projects_users

  has_many :contributed_texts, class_name: "Contribution::Text", dependent: :destroy
  has_many :contributed_images, class_name: "Contribution::Image", dependent: :destroy

  has_attached_file :image,
                    styles: {
                      medium: "400x200>",
                      thumb: "100x100#"
                    }

  validates_attachment :image, presence: true,
                               content_type: { content_type: %r{\Aimage/.*\Z} },
                               size: { less_than: 5.megabytes }

  def admins
    users.merge(ProjectsUser.admin)
  end

  def collaborators
    users.merge(ProjectsUser.collaborator)
  end
end
