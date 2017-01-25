class Item < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  mount_uploader :image, ItemPhotoUploader

  belongs_to :user
  has_many :reviews

  def self.search(query)
    where("title ilike ?", "%#{query}%")
  end

end
