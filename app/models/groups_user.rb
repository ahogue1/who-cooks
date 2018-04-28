# == Schema Information
#
# Table name: groups_users
#
#  group_id :integer
#  user_id  :integer
#  id       :integer          not null, primary key
#
# Indexes
#
#  index_groups_users_on_group_id  (group_id)
#  index_groups_users_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (user_id => users.id)
#

class GroupsUser< ApplicationRecord
  belongs_to :group
  belongs_to :user
end
