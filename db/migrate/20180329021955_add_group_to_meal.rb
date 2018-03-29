class AddGroupToMeal < ActiveRecord::Migration[5.1]
  def change
    add_reference :meals, :group, foreign_key: true
  end
end
