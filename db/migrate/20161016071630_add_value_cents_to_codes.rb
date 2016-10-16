class AddValueCentsToCodes < ActiveRecord::Migration
  def change
    add_column :codes, :value_cents, :decimal
  end
end
