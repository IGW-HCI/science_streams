class Contribution::Image < ApplicationRecord
  validates :copyright, presence: true
  validates :user_id, presence: true
  validates :project_id, presence: true

  belongs_to :project
  belongs_to :user

  has_attached_file :image,
                    styles: {
                      medium: "300x300>",
                      thumb: "100x100>"
                    }

  validates_attachment :image, presence: true,
                               content_type: { content_type: %r{\Aimage/.*\Z} },
                               size: { less_than: 5.megabytes }
end
