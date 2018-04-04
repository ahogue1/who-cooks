class AddRecipeToMeals < ActiveRecord::Migration[5.1]
  def change
    add_reference :meals, :recipe, foreign_key: true
  end
end
