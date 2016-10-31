class AddAddressToProducts < ActiveRecord::Migration
  def change
    add_column :products, :address, :string
  end
end
