class AddSellerAndBuyerToPurchases < ActiveRecord::Migration
  def change
    add_reference :purchases, :seller, index: true, foreign_key: true
    add_reference :purchases, :buyer, index: true, foreign_key: true
  end
end
