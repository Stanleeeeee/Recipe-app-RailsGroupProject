class Inventory < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :inventory_foods, foreign_key: 'inventory_id', dependent: :destroy
  has_many :foods, through: :inventory_foods

  def related_inventory_foods
    inventory_foods.includes(:food)
  end
end
