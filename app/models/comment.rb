class Comment < ApplicationRecord
  belongs_to :title, optional: true
  belongs_to :user

  validates :comment, presence: true
end
