class Food < ApplicationRecord
  belongs_to :user
  
  has_many :inventory_foods, dependent: :delete_all
  has_many :inventories, through: :inventory_foods, dependent: :destroy
  has_many :recipe_foods, dependent: :delete_all

  validates :measurement_unit, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
