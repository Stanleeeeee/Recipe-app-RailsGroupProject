class AddFoodToInventoryFoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :inventory_foods, :food, null: true, foreign_key: true
  end
end
