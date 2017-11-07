class FixAdminFistNameTypo < ActiveRecord::Migration[5.0]
  def change
    rename_column :admins, :fist_name, :first_name
  end
end
