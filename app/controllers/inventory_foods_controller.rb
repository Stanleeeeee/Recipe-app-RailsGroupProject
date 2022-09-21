class InventoryFoodsController < ApplicationController
    before_action :set_inventory

    def new
      @inventory_food = InventoryFood.new
      @foods = Food.all
    end
  
    def create
      @inventory_food = InventoryFood.new(inventory_food_params)
      @inventory_food.inventory_id = @inventory.id
  
      respond_to do |format|
        if @inventory_food.save
          format.html { redirect_to inventory_path(@inventory.id), notice: 'Inventory food was successfully created.' }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
end
