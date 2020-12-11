class Volume < ApplicationRecord
  belongs_to :title, optional: true
  has_one :user, through: :title

  validates :name, presence: true
  validates :content, presence: true
end
