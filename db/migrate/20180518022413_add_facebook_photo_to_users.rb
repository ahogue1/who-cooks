class AddFacebookPhotoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :facebook_photo, :string
  end
end
