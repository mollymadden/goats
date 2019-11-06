class AddStripeIdToDeposits < ActiveRecord::Migration[6.0]
  def change
    add_column :deposits, :stripe_charge_id, :string
  end
end
