class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :skill, :optional => true
  has_one_attached :image
  has_many :deposits

  enum gender: { female: 0, male: 1 }
  enum drop_off: { yes: 0, no: 1 }

end
