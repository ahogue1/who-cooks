# == Schema Information
#
# Table name: meals
#
#  id         :integer          not null, primary key
#  date       :date
#  name       :string
#  category   :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer
#  recipe_id  :integer
#
# Indexes
#
#  index_meals_on_group_id   (group_id)
#  index_meals_on_recipe_id  (recipe_id)
#  index_meals_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (recipe_id => recipes.id)
#  fk_rails_...  (user_id => users.id)
#

class Meal < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :recipe, optional: true
end
