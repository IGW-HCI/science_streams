class Profile < ApplicationRecord
  belongs_to :user, touch: true
end
