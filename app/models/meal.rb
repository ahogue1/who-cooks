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
#
# Indexes
#
#  index_meals_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Meal < ApplicationRecord
  belongs_to :user
end
