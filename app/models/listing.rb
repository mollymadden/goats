class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :skill, :optional => true
  has_one_attached :image
  has_many :deposits

  enum gender: { Female: 0, Male: 1 }
  enum drop_off: { Yes: 0, No: 1 }

end
