class RemoveGroupAdminFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :group_admin, :boolean
  end
end
