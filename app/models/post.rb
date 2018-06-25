class Post < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :reviews
  has_many :been_theres
  has_many :saves
  has_many :reports
  CATEGORIES = ["activites", "food/drinks"]
  STATUS = ["temporary", "permanent"]

end
