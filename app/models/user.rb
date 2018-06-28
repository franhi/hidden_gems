class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :photo, PhotoUploader
  has_many :posts
  has_many :reviews
  has_many :likes
  has_many :been_theres
  has_many :favorites
  has_many :reports
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  acts_as_voter

end
