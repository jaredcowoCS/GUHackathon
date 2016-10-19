class AddSellerAndBuyerToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :seller, index: true, foreign_key: true
    add_reference :users, :buyer, index: true, foreign_key: true
  end
end
