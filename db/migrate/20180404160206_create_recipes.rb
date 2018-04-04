class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :url
      t.string :label
      t.string :image
      t.string :source
      t.integer :yield
      t.float :calories
      t.string :diet_labels
      t.string :health_labels

      t.timestamps
    end
  end
end
