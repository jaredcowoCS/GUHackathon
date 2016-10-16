class ChangeValueFormatInCodes < ActiveRecord::Migration
  def change
  	change_column :codes, :value, :decimal
  end
end
