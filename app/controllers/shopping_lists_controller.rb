class ShoppingListsController < ApplicationController
  before_action :set_shopping_list

  def index
    @food_list = compare
    @total_price = sum(@food_list)
  end

  def new
    @inventories = Inventory.where(user_id: current_user.id)
  end

  def create
    @inventory = Inventory.find(params[:inventory_id])
    respond_to do |format|
      format.html do
        redirect_to "/shopping_list/#{@recipe.id}/#{@inventory.id}", notice: 'Shopping list was successfully generated.'
      end
    end
  end
end
