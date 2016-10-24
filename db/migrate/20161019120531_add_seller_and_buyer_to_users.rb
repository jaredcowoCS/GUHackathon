class AddSellerAndBuyerToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :seller, index: true 
    add_reference :users, :buyer, index: true
  end
end
