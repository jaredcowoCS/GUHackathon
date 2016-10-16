class ChangePriceCentsFormatInCodes < ActiveRecord::Migration
  def change
  	change_column :products, :price_cents, :decimal
  end
end
