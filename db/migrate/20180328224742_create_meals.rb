class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.date :date
      t.string :name
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
