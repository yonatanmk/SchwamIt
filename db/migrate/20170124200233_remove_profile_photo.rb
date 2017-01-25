class RemoveProfilePhoto < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :profile_photo
  end
end
