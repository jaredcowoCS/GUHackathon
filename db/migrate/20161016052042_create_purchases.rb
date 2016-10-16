class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :code, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
