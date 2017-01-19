class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :items
  has_many :reviews

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable
end
