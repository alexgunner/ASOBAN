class AddAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :admin, foreign_key: true
  end
end
