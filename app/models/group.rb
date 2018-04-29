# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ApplicationRecord
  has_many :groups_users, dependent: :destroy
  has_many :users, through: :groups_users
  has_many :meals, dependent: :destroy
  accepts_nested_attributes_for :groups_users, reject_if: :all_blank, allow_destroy: true
end
