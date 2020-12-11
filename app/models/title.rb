class Title < ApplicationRecord
  belongs_to :user
  has_many :volumes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :novels
  validates :name, presence: true, uniqueness: true
end