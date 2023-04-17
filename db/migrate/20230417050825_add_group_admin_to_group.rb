class AddGroupAdminToGroup < ActiveRecord::Migration[7.0]
  def change
    add_reference :groups, :admin, foreign_key: { to_table: :users }
  end
end
