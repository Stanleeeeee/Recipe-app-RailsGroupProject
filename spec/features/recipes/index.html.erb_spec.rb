require 'rails_helper'

RSpec.describe 'recipes/index', type: :feature do
  before :each do
    @user = User.create(name: 'test', email: 'test@gmail.com', password: 'password')
    @user.save
    login_as(@user)
    @recipe = Recipe.create(name: 'Recipe 1', description: 'Recipe description', user: @user)
    visit recipes_path
  end

  describe "Visit recipes' index page" do
    it 'should have Recipe name' do
      expect(page).to have_text('Recipe 1')
    end

    it 'should have Recipe description' do
      expect(page).to have_text('Recipe description')
    end

    it 'should have delete button' do
      expect(page).to have_selector(:link_or_button, 'Remove', exact: true)
    end

    it 'redirect to details page' do
      click_link('show more')
      expect(page).to have_current_path(recipe_path(@recipe))
    end

    it 'should delete Recipe' do
      click_button('Remove')
      @recipes = Recipe.all
      expect(@recipes).not_to include @recipe
    end
  end
end
