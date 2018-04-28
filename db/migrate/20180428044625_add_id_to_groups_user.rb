class AddIdToGroupsUser < ActiveRecord::Migration[5.1]
  def change
    add_column :groups_users, :id, :primary_key
  end
end
