class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :value,
    inclusion: { in: [-1,0,1] },
    numericality: true
end
