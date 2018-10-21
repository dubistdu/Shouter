class Shout < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: (1..150)
  validates :user, presence: true
end
