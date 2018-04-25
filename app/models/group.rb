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
  has_many :groups_users
  has_many :users, through: :groups_users
  has_many :meals
  accepts_nested_attributes_for :groups_users, reject_if: :all_blank, allow_destroy: true

  def self.build(group_params, user)
    group = Group.new(group_params)
    group.users << user

    group
  end

end
