class Comment < ApplicationRecord
  belongs_to :title, optional: true
  has_one :user, through: :title

  validates :comment, presence: true
end
