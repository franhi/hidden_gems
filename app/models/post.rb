class Post < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :been_theres, dependent: :destroy
  has_many :saves, dependent: :destroy
  has_many :reports, dependent: :destroy

  CATEGORIES = ["general", "entertainment", "sports", "hobby", "design", "art", "mind-blowing", "music", "relax", "food", "drinks"]
  STATUS = ["temporary", "permanent"]

  include PgSearch
  pg_search_scope :search_post,
    against: [ :title, :category, :status, :address, :begin_date, :end_date ],
    using: {
      tsearch: { prefix: true }
    }
end
