class Profile < ApplicationRecord
  validates :nickname, presence: true
  validates :slug, presence: true
  belongs_to :user, touch: true
end
