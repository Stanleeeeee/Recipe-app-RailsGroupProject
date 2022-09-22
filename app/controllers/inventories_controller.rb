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

    def create
        @inventory = current_user.inventories.new(inventory_params)
        respond_to do |format|
          if @inventory.save
            format.html { redirect_to inventories_path, notice: 'Inventory was successfully created.' }
          else
            format.html { render :new, status: :unprocessable_entity }
          end
        end
    end

    private

  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end
end
