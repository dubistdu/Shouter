class Shout < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: (1..150)
  validates :user, presence: true
# order_by the latest one on top
# approach this method with a caution. it's ok here for a simple reordering.
# why is sorting in controller not recommended?
  default_scope { order(created_at: :desc) }

# not to viloate law of demeter either make a method to shorten user.username, or use delegate
  delegate :username, to: :user
end
