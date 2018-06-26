class Review < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  acts_as_votable
  belongs_to :post
  belongs_to :user
  has_many :likes
end
