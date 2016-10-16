class AddCodeToCodes < ActiveRecord::Migration
  def change
    add_column :codes, :code, :string, unique: true
  end
end
