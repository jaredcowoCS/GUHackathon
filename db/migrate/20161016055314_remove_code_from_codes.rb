class RemoveCodeFromCodes < ActiveRecord::Migration
  def change
  	remove_column :codes, :code
  end
end
