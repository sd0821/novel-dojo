class Title < ApplicationRecord
  belongs_to :user
  has_many :volumes
  has_many :comments
  validates :name, presence: true, uniqueness: true
end