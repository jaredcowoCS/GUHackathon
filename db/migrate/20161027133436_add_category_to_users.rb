class AddCategoryToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :category, index: true, foreign_key: true
  end
end
