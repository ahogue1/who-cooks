# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  uri        :string
#  quantity   :float
#  measure    :string
#  name       :string
#  recipe_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_ingredients_on_recipe_id  (recipe_id)
#
# Foreign Keys
#
#  fk_rails_...  (recipe_id => recipes.id)
#

class Ingredient < ApplicationRecord
  belongs_to :recipe
end
