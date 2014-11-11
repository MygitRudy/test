class AddAdminRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin_role, :boolean
  end
end
