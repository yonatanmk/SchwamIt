class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :items

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
  :trackable, :validatable
end
