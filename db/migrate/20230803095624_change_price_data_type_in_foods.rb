class ChangePriceDataTypeInFoods < ActiveRecord::Migration[7.0]
  def change
    change_column :foods, :price, :decimal, precision: 10, scale: 2, using: 'price::numeric'
  end
end
