class InventoriesController < ApplicationController
    def index
      @inventories = Inventory.where(user_id: current_user.id)
    end
    
    def show
      @inventory = Inventory.find(params[:id])
    end
    
    def new
      @inventory = Inventory.new
    end
end
