class InventoryFood < ApplicationRecord
  belongs_to :inventory, class_name: 'Inventory', foreign_key: 'inventory_id'
  belongs_to :food, class_name: 'Food', foreign_key: 'food_id'

  validates :quantity, numericality: { greater_than: 0 }, presence: true
end
