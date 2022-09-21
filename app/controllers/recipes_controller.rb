class RecipesController < ApplicationController
  def index
    unless current_user.nil?
      @current_user = current_user
      @recipes = @current_user.recipes
    end
  end
  def show 
    @recipe = Recipe.find(params[:id])
  end
  def public
    @recipes = Recipe.where(public: true)
  end
end
