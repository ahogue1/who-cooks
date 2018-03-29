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
  has_and_belongs_to_many :users
  has_many :meals

  def self.build(group_params, user)
    group = Group.new(group_params)
    group.users << user

    group
  end

end
