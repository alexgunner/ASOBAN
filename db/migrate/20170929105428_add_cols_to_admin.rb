class AddColsToAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :can_manage_boxes, :boolean
    add_column :admins, :can_manage_messages, :boolean
    add_column :admins, :can_manage_categories, :boolean
  end
end
