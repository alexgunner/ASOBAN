class RemoveFieldsFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :start_date
    remove_column :events, :end_date
    remove_column :events, :location
  end
end
