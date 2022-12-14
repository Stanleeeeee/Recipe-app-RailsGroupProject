class Inventory < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :inventory_foods, foreign_key: 'inventory_id', dependent: :destroy
  has_many :foods, through: :inventory_foods, dependent: :destroy

  validates :name, presence: true

  def related_inventory_foods
    inventory_foods.includes(:food)
  end
end
