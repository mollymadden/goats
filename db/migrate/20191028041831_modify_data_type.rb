class ModifyDataType < ActiveRecord::Migration[6.0]
  def change
    remove_column :listings, :gender, :boolean
    add_column :listings, :gender, :integer
    remove_column :listings, :drop_off, :boolean
    add_column :listings, :drop_off, :integer
  end
end
