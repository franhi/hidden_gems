class Post < ApplicationRecord

  # mount_uploader :photo, PhotoUploader


  geocoded_by :address
  after_validation :geocode, if: (:will_save_change_to_street? || :will_save_change_to_city? || :will_save_change_to_country?)


  belongs_to :user, optional: true
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validate :title


  STATUS = ["permanent", "temporary"]

  include PgSearch
  pg_search_scope :search_post,
    against: [ :title, :status, :street, :category, :city, :country, :begin_date, :end_date ],
    associated_against: {
      tags: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }

  def address
    [self.street, self.city, self.country].compact.join(', ')
  end


  def average
    ratings = 0
    average = 0
    self.reviews.each do |review|
      if self.reviews.count == 0
        average = "No ratings"
      else
        ratings += review.rating unless review.rating.nil?
        average = ratings / self.reviews.count
      end
    end

    return average
  end

  def self.best_posts
    averages = []
    return self.all.sort {  |x, y|  y.average <=> x.average }
  end

end
