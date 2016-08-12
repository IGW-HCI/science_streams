class Profile < ApplicationRecord
  validates :nickname, presence: true
  validates :slug, presence: true
  belongs_to :user, touch: true

  has_attached_file :image,
                    styles: {
                      medium: "300x300#",
                      thumb: "100x100#"
                    }

  validates_attachment :image, presence: true,
                               content_type: { content_type: %r{\Aimage/.*\Z} },
                               size: { less_than: 5.megabytes }
end
