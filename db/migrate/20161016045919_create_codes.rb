class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :code, unique: true
      t.decimal :value, :decimal, :precision => 8, :scale => 2

      t.timestamps null: false
    end
  end
end
