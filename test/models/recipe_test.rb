# == Schema Information
#
# Table name: recipes
#
#  id            :integer          not null, primary key
#  url           :string
#  label         :string
#  image         :string
#  source        :string
#  yield         :integer
#  calories      :float
#  diet_labels   :string
#  health_labels :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
