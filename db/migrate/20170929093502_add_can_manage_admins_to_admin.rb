class AddCanManageAdminsToAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :can_manage_admins, :boolean
  end
end
