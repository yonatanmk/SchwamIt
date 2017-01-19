class Review < ApplicationRecord
  validates :rating, presence: true, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5, message: "Rating must be between 1 - 5"}
  validates :body, presence: true
  validates :score, presence: true, numericality: true
  validates :user, presence: true
  validates :item, presence: true

  belongs_to :user
  belongs_to :item
end
