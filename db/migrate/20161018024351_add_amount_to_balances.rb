class AddAmountToBalances < ActiveRecord::Migration
  def change
    add_column :balances, :amount_cents, :decimal, :default=>0.0, :null => false
  end
end
