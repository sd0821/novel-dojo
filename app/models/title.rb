class Title < ApplicationRecord
  belongs_to :user
  has_many :volumes
  has_many :comments
  has_many :novels
  validates :name, presence: true, uniqueness: true
end