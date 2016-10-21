class AddDistrictToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :district, index: true, foreign_key: true
  end
end
