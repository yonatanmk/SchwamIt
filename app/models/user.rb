class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :items
  has_many :reviews
  has_many :votes

  # mount_uploader :profile_photo, ProfilePhotoUploader

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable
end
