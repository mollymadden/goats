class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  has_one_attached :image
  has_one :deposit, through: :user

  enum gender: { Female: 0, Male: 1 }
  enum drop_off: { Yes: 0, No: 1 }

end
