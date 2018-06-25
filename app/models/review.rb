class Review < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :post
  belongs_to :user
  has_many :likes
end
