class AddSellerAndBuyerToPurchases < ActiveRecord::Migration
  def change
    add_reference :purchases, :seller, index: true
    add_reference :purchases, :buyer, index: true
  end
end
