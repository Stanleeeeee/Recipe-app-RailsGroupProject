require 'rails_helper'

RSpec.describe 'inventories/show', type: :feature do
  before do
    @user = User.create(name: 'name', email: 'name@gmail.com', password: 'password')
    @user.save
    login_as(@user)
    @inventory = Inventory.create(name: 'Inventory 1', description: 'description', user: @user)
    @inventory.save
    @food = Food.create(name: 'Cake', measurement_unit: 'gram', price: 50)
    @food.save
    @inventory_food = InventoryFood.create(quantity: 65, inventory: @inventory, food: @food)
    visit inventory_path(@inventory)
  end

  describe "Visit inventories' show page" do
    it 'should have inventory name header' do
      expect(page).to have_text('Inventory 1')
    end

    it 'should have quantity title' do
      expect(page).to have_text('Quantity')
    end

    it 'should have Action title' do
      expect(page).to have_text('Actions')
    end

    it 'should have link to add food' do
      expect(page).to have_selector(:link_or_button, 'Add Food', exact: true)
    end

    it 'redirect to add food in inventory page' do
      click_link('Add Food', exact: true)
      expect(page).to have_current_path(new_inventory_inventory_food_path(@inventory))
    end
  end
end
