class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
  end


  private

  def recipe_params
    params.require(:recipe).permit(:recipe_id)
  end

end
