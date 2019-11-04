class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  has_one_attached :image
  has_one :deposit, through: :user

  enum gender: { Female: 0, Male: 1 }
  enum drop_off: { Yes: 0, No: 1 }

  def self.search(search)
    skills_listing = Listing.connection.select_all( "SELECT skills.title, listings.* FROM skills INNER JOIN listings ON listings.skill_id = skills.id WHERE skills.id = #{search}" )

    #Listing.find_by_sql( "SELECT skills.title, listings.* FROM listings INNER JOIN skills ON listings.skill_id = skills.id WHERE #{search}" )

  end

end
