class RemoveValueFromCodes < ActiveRecord::Migration
  def change
  	remove_column :codes, :value
  end
end
