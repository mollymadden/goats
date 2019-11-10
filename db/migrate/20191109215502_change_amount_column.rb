class ChangeAmountColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :deposits, :amount, :integer
    add_column :deposits, :date, :date
    remove_column :deposits, :stripe_charge_id, :string
  end
end
