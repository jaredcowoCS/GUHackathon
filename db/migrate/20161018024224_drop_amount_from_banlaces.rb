class DropAmountFromBanlaces < ActiveRecord::Migration
  def change
  	remove_column :balances, :amount
  end
end
