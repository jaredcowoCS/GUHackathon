class DropDecimalFromCodes < ActiveRecord::Migration
  def change
  	remove_column :codes, :decimal
  end
end
