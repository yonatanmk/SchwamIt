class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :review
  validats :value, inclusion: { in: [-1,1] }
end
