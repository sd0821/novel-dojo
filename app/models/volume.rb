class Volume < ApplicationRecord
  belongs_to :title
  has_one :user, through: :title
end
