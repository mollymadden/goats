class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.integer :price
      t.text :description
      t.boolean :gender
      t.string :breed
      t.string :skill
      t.boolean :drop_off
      t.text :notes

      t.timestamps
    end
  end
end
