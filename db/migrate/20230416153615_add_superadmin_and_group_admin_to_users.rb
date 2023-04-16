class AddSuperadminAndGroupAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :superadmin, :boolean, default: false
    add_column :users, :group_admin, :boolean, default: false
  end
end
