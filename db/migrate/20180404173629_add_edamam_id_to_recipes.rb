class AddEdamamIdToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :edamam_id, :string
  end
end
