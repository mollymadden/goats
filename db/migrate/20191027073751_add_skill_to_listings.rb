class AddSkillToListings < ActiveRecord::Migration[6.0]
  def change
    add_reference :listings, :skills, null: false, foreign_key: true
  end
end
