class User < ApplicationRecord
  include Clearance::User
  validates :username, presence: true, uniqueness: true
  # if user is deleted how is the dependent going to be handled - destroy
  has_many :shouts, dependent: :destroy
end
